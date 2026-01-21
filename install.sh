#!/usr/bin/env bash

function verb() {
	# $1 = STRING
	
	echo "$1" >&2
}

which pacman 1> /dev/null 2>&1 || { verb "OS Unsupported"  ; exit 1 ; }
which fd     1> /dev/null 2>&1 || { verb "missing fd"      ; exit 1 ; }
which git    1> /dev/null 2>&1 || { verb "missing git"     ; exit 1 ; }

function printHelp() {
	verb 'install.sh: install Saul-Dickson/dotfiles'
	verb ''
	verb 'Usage: install.sh [OPTION]'
	verb '-V         :        Print verbose logs'
	verb '-h         :        Print this message and exit'
	verb '-s <string>:        Symlink dotfiles using option string'
	verb '           :        Option string format is an option char or chars separated commas, e.g. "h,s,d"'
	verb '           :        Possible options                                                               :        '
	verb '           :        "h" Home directory symlinks'
	verb '           :        "s" Local scripts symlinks'
	verb '           :        "d" XDG_DATA_HOME subdirectory symlinks'
	verb '           :        "c" XDG_CONFIG_HOME subdirectory symlinks'
	verb '           :        "r" Root-level configuration file symlinks'
	verb '-S         :        Symlink all dotfiles'
	verb '-H <path>  :        Alternative home directory for symlinking'
	verb '-p         :        Install arch packages'
	verb '-P         :        Install AUR packages'
	verb '-g         :        Install dotfiles from external git repository to a path of your choosing.'
	verb '           :        Valid Syntax: "<URL>::<PATH>"; "<PATH>" is optional, but must be separated from URL by "::"'
	verb '-I         :        Install all dotfiles'
	verb ''
}

function verifyInstallDirs() {
	# $1 = BOOLEAN
	# $2 = PATH
	
	required_dirs=(                \
		"${2}/.config"            \
		"${2}/.cache/zsh"         \
		"${2}/.cache/nvim"        \
		"${2}/.local/share"       \
		"${2}/.local/share/vim"   \
		"${2}/.local/share/nvim"  \
		"${2}/.local/share/mail"  \
		"${2}/.local/share/lf"    \
		"${2}/.local/share/Steam" \
		"${2}/.local/bin"         \
		"${2}/.local/src"         \
		"${2}/.local/lib"		   \
	)

	$1 && verb "verifying presence of requisite directories..."

	for dir in "${required_dirs[@]}"; do
		if ! [ -d "$dir" ]; then
			if $1; then
				verb "$dir does not exist!"
				verb "creating ${dir}..."
			fi

			mkdir -p "$dir" 1> /dev/null 2>&1
		else
			$1 && verb "$dir located successfully"
			continue
		fi
	done
}

function getConfigDirs() {
	# $1 = BOOLEAN
	# $2 = PATH
	
	$1 && verb "retrieving XDG_CONFIG_HOME directories"

	fd -Hat d --exact-depth 1 "" "${2}/.config/" -0
}

function getShareDirs() {
	# $1 = BOOLEAN
	# $2 = PATH
	
	$1 && verb "retrieving XDG_DATA_HOME directories"

	fd -Hat d --exact-depth 1 "" "${2}/.local/share/" -0
}

function getLocalScripts() {
	# $1 = BOOLEAN
	# $2 = PATH
	
	$1 && verb "retrieving local scripts"

	fd -Hat f --exact-depth 1 "" "${2}/.local/bin" -0
}

function getHomeFiles() {
	# $1 = BOOLEAN
	# $2 = PATH
	
	$1 && verb "Enumerating home directory files.."

	fd -Hat f --exact-depth 1 "" "${2}/home" -0
}

function getRootFiles() {
	# $1 = BOOLEAN
	# $2 = PATH
	
	verb "Symlinking root configuration files requires the use of sudo."
	verb "Warning: Symlinking root configuration files may break existing configs. Proceed with caution."
	
	while true; do
		read -p "Proceed with root file enumeration? (y/N): " response

		if [ -n "$response" ]; then
			proceed="$response"
		else
			proceed="n"
		fi

		case "$proceed" in
			[yY]*) # enumerate files for symlinking
				$1 && verb "Proceeding with file enumeration..."
				fd -Hat f "" "${2}/root" -0
				break
				;;
			[nN]*) # return nothing
				$1 && verb "Skipping root file enumeration..."
				break
				;;
			*) # all other inputs
				verb "Error: Invalid input."
				continue
				;;
		esac
	done
}

function genDest() {
	# $1 = BOOLEAN
	# $2 = PATH
	# $3 = PATH
	# $4 = PATH
	
	$1 && verb "generating link for $2..."

	base_dir="$(basename "$3")"
	blueprint=$( \
		awk -F "$base_dir/" \
		'{ print $2 }' \
		<<< "$2"
	)

	output="${4}/${blueprint}"
	
	$1 && verb "link for $2 is $output"
	echo "$output"
}

function enumerateSymlinks() {
	# $1 = BOOLEAN
	# $2 = ARRAY (source)
	# $3 = ARRAY (Target Regular)
	# $4 = ARRAY (Target Home)
	# $5 = ARRAY (Target Root)
	# $6 = PATH
	
	$1 && verb "Enumerating symlinks..."
	
	local -n symlink_types=$2
	local -n symlinks_reg=$3
	local -n symlinks_home=$4
	local -n symlinks_root=$5

	if [[ "${symlink_types[homefiles]}" == true || "${symlink_types[all]}" == true ]]; then
		$1 && verb "Enumerating home directory configuration files..."
		mapfile -O "${#symlinks_home[@]}" -d '' symlinks_home < \
			<(getHomeFiles $verbose "$6")
	fi

	if [[ "${symlink_types[scripts]}" == true || "${symlink_types[all]}" == true ]]; then
		$1 && verb "Enumerating custom scripts..."
		mapfile -O "${#symlinks_reg[@]}" -d '' symlinks_reg < \
			<(getLocalScripts $verbose "$6")
	fi

	if [[ "${symlink_types[datadirs]}" == true || "${symlink_types[all]}" == true ]]; then
		$1 && verb "Enumerating XDG_DATA_HOME subdirectories..."
		mapfile -O "${#symlinks_reg[@]}" -d '' symlinks_reg < \
			<(getShareDirs $verbose "$6")
	fi

	if [[ "${symlink_types[configdirs]}" == true || "${symlink_types[all]}" == true ]]; then
		$1 && verb "Enumerating XDG_CONFIG_HOME configurations..."
		mapfile -O "${#symlinks_reg[@]}" -d '' symlinks_reg < \
			<(getConfigDirs $verbose "$6")
	fi

	if [[ "${symlink_types[rootfiles]}" == true || "${symlink_types[all]}" == true ]]; then
		$1 && verb "Enumerating root-level configuration files..."
		mapfile -O "${#symlinks_root[@]}" -d '' symlinks_root < \
			<(getRootFiles $verbose "$6")
	fi
}

function symlinkUtil() {
	# $1 = BOOLEAN
	# $2 = PATH
	# $3 = PATH
	# $4 = STRING
	# $5 = STRING
	
	src="$2"
	dest="$3"

	local -n overwrite_symlink="$4"
	local -n overwrite_file="$5"

	if [ -L "$dest" ] && [[ "$(realpath $dest)" == "$src" ]]; then
		$1 && verb "$src symlink to $dest already exists. Skipping..."
		return
	elif [ -L "$dest" ] && [[ "$(realpath "$dest")" != "$src" ]]; then
		verb "Symlink to $dest already exists, but resolves to $(realpath "$dest")"

		while true; do
			read -p "Would you like to overwrite this symlink? (y/N/a/s): " overwrite

			if [ -n "$overwrite" ]; then
				overwrite_symlink="$overwrite"
			fi

			case $overwrite_symlink in
				[yY]*) # overwrite current symlink
					$1 && verb "Overwriting symlink $dest ..."
					ln -svf "$src" "$dest"
					overwrite_symlink="n"
					break
					;;
				[aA]*) # overwrite all issues of this type
					$1 && verb "Overwriting symlink $dest ..."
					ln -svf "$src" "$dest"
					break
					;;
				[nN]*) # skip symlinking process
					$1 && verb "Skipping symlink $dest ..."
					overwrite_symlink="n"
					break
					;;
				[sS]*) # skip all issues of this type
					$1 && verb "Skipping symlink $dest ..."
					break
					;;
				*) # illegal input
					verb "Error: Invalid input."
					continue
					;;
			esac
		done
	elif ! [ -e "$dest" ]; then
		$1 && verb "Symlinking $src to $dest ..."
		ln -sv "$src" "$dest"
	else
		verb "$dest already exists as file."

		while true; do
			read -p "Would you like to overwrite this file? (y/N/a/s): " overwrite

			if [ -n "$overwrite" ]; then
				overwrite_file="$overwrite"
			fi

			case $overwrite_file in
				[yY]*) # overwrite current symlink
					$1 && verb "Overwriting file $dest ..."
					rm -r "$dest"
					ln -svf "$src" "$dest"
					overwrite_file="n"
					break
					;;
				[aA]*) # overwrite all issues of this type
					$1 && verb "Overwriting file $dest ..."
					rm -r "$dest"
					ln -svf "$src" "$dest"
					break
					;;
				[nN]*) # skip symlinking process
					$1 && verb "Skipping symlink $dest ..."
					overwrite_file="n"
					break
					;;
				[sS]*) # skip all issues of this type
					$1 && verb "Skipping symlink $dest ..."
					break
					;;
				*) # illegal input
					verb "Error: Invalid input."
					continue
					;;
			esac
		done
	fi
}

function symlinkRoot() {
	# $1 = BOOLEAN
	# $2 = ARRAY
	# $3 = PATH
	# $4 = PATH
	
	$1 && verb "Symlinking root-level configuration files..."

	overwrite_symlink="n"
	overwrite_file="n"

	if [[ "$4" == "$HOME" ]]; then
		origin_dir=""
	elif [[ "$4" != "$HOME" ]]; then
		origin_dir="$4"
	fi

	for src in "${2[@]}"; do
		dest="$(genDest $verbose "$src" "$3" "$origin_dir" | sed 's/root\///g')"
		
		symlinkUtil $1 "$src" "$dest" "$overwrite_symlink" "$overwrite_file"
	done
}

function symlinkHome() {
	# $1 = BOOLEAN
	# $2 = ARRAY
	# $3 = PATH
	# $4 = PATH
	
	$1 && verb "Symlinking home directory dotfiles..."

	overwrite_symlink="n"
	overwrite_file="n"

	for src in "${2[@]}"; do
		dest="$(genDest $verbose "$src" "$3" "$4" | sed 's/home\///g')"
		
		symlinkUtil $1 "$src" "$dest" "$overwrite_symlink" "$overwrite_file"
	done
}

function symlinkReg() {
	# $1 = BOOLEAN
	# $2 = ARRAY
	# $3 = PATH
	# $4 = PATH
	
	$1 && verb "Symlinking user-level dotfiles..."

	overwrite_symlink="n"
	overwrite_file="n"

	for src in "${2[@]}"; do
		dest="$(genDest $verbose "$src" "$3" "$4")"
		
		symlinkUtil $1 "$src" "$dest" "$overwrite_symlink" "$overwrite_file"
	done
}

function resolveSymlinks() {
	# $1 = BOOLEAN
	# $2 = STRING (FORMAT = '([a-zA-Z],)*')
	# $3 = ARRAY (TARGET)
	
	$1 && verb "Resolving symlink settings from ${2}..."

	local -n symlink_types=$3

	IFS_bak="$IFS"
	IFS=',' read -ra types <<< "$2"
	IFS="$IFS_bak"

	for type in "${types[@]}"; do
		case "$type" in
			s) # enable custom script symlinking
				$1 && verb "symlink_set[scripts] Enabled"
				symlink_types[scripts]=true
				;;
			d) # enable XDG_DATA_DIR subdirectory symlinking
				$1 && verb "symlink_set[datadirs] Enabled"
				symlink_types[datadirs]=true
				;;
			c) # enable XDG_CONFIG_DIR subdirectory symlinking
				$1 && verb "symlink_set[configdirs] Enabled"
				symlink_types[configdirs]=true
				;;
			h) # enable home directory configuration file symlinking
				$1 && verb "symlink_set[homefiles] Enabled"
				symlink_types[homefiles]=true
				;;
			r) # enable root-level configuration file symlinking
				$1 && verb "symlink_set[rootfiles] Enabled"
				symlink_types[rootfiles]=true
				;;
			*) # unknown or illegal arguments
				verb "Syntax Error: Illegal argument '${type}' for -s"
				verb "Syntax for -s is 'argument,argument'"
				echo >&2
				printHelp
				exit 99
				;;
		esac
	done

	return
}

function installArchOfficial() {
	# $1 = BOOLEAN
	# $2 = PATH
	# $3 = STRING (Defaults to "arch_official.txt")
	
	verb "Installing official arch packages requires the use of sudo."

	proceed="y"

	while true; do
		read -p "Do you wish to proceed? (Y/n): " choice

		if [ -n "$choice" ]; then
			proceed="$choice"
		fi

		case "$proceed" in 
			[yY]*) # proceed with installation
				verb "Installing packages from arch official repositories..."
				break
				;;
			[nN]*) # cancel installation
				verb "Cancelling installation of arch official repositories..."
				return
				;;
			*) # unrecognized argument
				verb "Invalid input, please try again."
				proceed="y"
				continue
				;;
		esac
	done
	
	if [ -f "${2}/${3}" ]; then
		filename="$3"
	else
		filename="arch_official.txt"
	fi

	sudo pacman -S --needed - < "${2}/${filename}"
}

function installAUR() {
	# $1 = BOOLEAN
	# $2 = PATH
	# $3 = STRING (Defaults to "arch_aur.txt")
	
	verb "Installing packages from the AUR requires the use of sudo"

	proceed="y"

	while true; do
		read -p "Do you wish to proceed? (Y/n): " choice

		if [ -n "$choice" ]; then
			proceed="$choice"
		fi

		case "$proceed" in 
			[yY]*) # proceed with installation
				verb "Installing packages from AUR..."
				break
				;;
			[nN]*) # cancel installation
				verb "Cancelling installation of AUR packages..."
				return
				;;
			*) # unrecognized argument
				verb "Invalid input, please try again."
				proceed="y"
				continue
				;;
		esac
	done

	if [ -f "${2}/${3}" ]; then
		filename="$3"
	else
		filename="arch_aur.txt"
	fi

	mapfile -t packages < "${2}/${filename}"

	declare -a repo_list

	for repo in "${packages[@]}"; do
		verb "Cloning https://aur.archlinux.org/${repo}.git into $HOME/.cache/aur/${repo}..."
		git clone -q "https://aur.archlinux.org/${repo}.git" "$HOME/.cache/aur/${repo}" && \
		repo_list+=( "$HOME/.cache/aur/${repo}" )
	done
	
	for repo in "${repo_list[@]}"; do
		verb "PKGBUILD ${repo}"
		(cd "$repo" && makepkg -si)
	done
}

function gitPull() {
	# $1 = BOOLEAN
	# $2 = "STRING::PATH"
	# $3 = PATH
	
	input_url="$(awk -F '::' '{ print $1 }' <<< "${2}")"
	input_path="$(awk -F '::' '{ print $2 }' <<< "${2}")"
	
	if git ls-remote "$input_url" 1> /dev/null 2>&1; then
		$1 && verb "URL '$input_url' is a valid git repository."
		$1 && verb "Proceeding with git repo installation..."
		git_url="$input_url"
	else
		verb "Error: '$input_url' is not a valid git repository."
		verb "Cancelling installation of git repo..."
		return
	fi

	$1 && verb "Checking if user-defined PATH is valid..."

	if pathchk "$input_path" && [ -n "$input_path" ]; then
		$1 && verb "$input_path is valid; skipping destination path generation..."
		mkdir -p "$(dirname "$input_path")"
		dest="$input_path"
	else
		$1 && verb "User-defined destination '${input_path}' invalid."
		$1 && verb "Generating destination path for git repository..."

		git_user="$(awk -F "/" '{ print $(NF - 1) }' <<< "${git_url}")"
		git_projname="$(awk -F "/" '{sub(/\.git$/, ""); print $NF }' <<< "${git_url}")"

		domain="$(awk -F "/" '{ print $3 }' <<< "${git_url}")"
		git_domain="$(awk -F '.' '{ print $(NF - 1)"."$NF }' <<< "${domain}")"

		dest="$HOME/.local/src/${git_domain}/${git_user}/${git_projname}"
		$1 && verb "Cloning destination ${dest}..."
	fi

	local -n root=$3

	root="$dest"
	git clone "$git_url" "$dest"
}

unset script_root
unset verbose
unset repo_string

declare -A symlink_set
symlink_set[homefiles]=false
symlink_set[scripts]=false
symlink_set[datadirs]=false
symlink_set[configdirs]=false
symlink_set[rootfiles]=false
symlink_set[all]=false

verbose=false
dotfiles_root="$PWD"
home_dir="$HOME"
install_aur=false
install_arch=false
full_install=false

while getopts ":Vhs:SH:pPg:t:I" option; do
	case $option in
		V) # enable verbosity
			verbose=true
			;;
		h) # print help message and exit
			printHelp
			exit 0
			;;
		s) # enable symlink_set[$OPTARG]
			resolveSymlinks $verbose "$OPTARG" symlink_set
			;;
		S) # symlink all dotfiles
			symlink_set[all]=true
			;;
		H) # alternative "home" directory to symlink dotfiles to.
			home_dir="$OPTARG"
			;;
		p) # install packages from arch core repository
			install_arch=true
			;;
		P) # intall packages from arch user repository
			install_aur=true
			;;
		g) # install dotfiles from external git repository
			repo_string="$OPTARG"
			;;
		t) # install dotfiles from directory on-system
			dotfiles_root="$OPTARG"
			;;
		I) # install all dotfiles
			full_install=true
			;;
	esac
done
