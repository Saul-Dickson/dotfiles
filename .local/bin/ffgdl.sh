which lz4jsoncat &> /dev/null || (echo 'Missing lz4jsoncat'; exit 1) &
which jq		 &> /dev/null || (echo 'Missing jquery'    ; exit 1) &
which gallery-dl &> /dev/null || (echo 'Missing gallery-dl'; exit 1) &
which fd         &> /dev/null || (echo 'Missing fd'        ; exit 1) &
[ -z ${BROWSER+x} ]           && (echo '$BROWSER is unset' ; exit 1)

function get_url_firefox () {
	lz4jsoncat "$1" |\
	jq -r ".windows[0].tabs | sort_by(.lastAccessed)[-1] | .entries[.index-1] | .url"
}

function get_url_domain () {
	echo $1 | awk -F[/:] '{print $4}'
}

export recovery_file=""
export download_url=""
export download_domain=""

case $BROWSER in
	"zen-browser")
		export recovery_file=$(fd 'recovery.jsonlz4' $HOME/.zen)
		export download_url=$(get_url_firefox "$recovery_file")
		;;
	"firefox")
		export recovery_file=$(fd 'recovery.jsonlz4' $HOME/.mozilla/firefox)
		export download_url=$(get_url_firefox "$recovery_file")
		;;
	*)
		echo "$BROWSER unsupported"; exit 1
		;;
esac

export download_domain=$(get_url_domain $download_url)

gallery-dl -D "$HOME/Downloads/$download_domain/" $download_url
