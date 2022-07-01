# An fzf script for using the himalaya email client. Current features:
#
# - List emails
# - Search emails (using IMAP querying, not fzf)
# - Read emails in preview window
# - View attachments
# - Mark email as read
# - Delete email
# - Reply to email
# - Multi-account support
#
# Future features:
#
# - Read emails externally in w3m for interactive links
# - Move view attachments, reply, other functionality to a prompt after reading
#   externally to clean up UI
#
# Authored by Callum Macrae, released under MIT license.
#
# This file, despite the file extension, works in both bash and ZSH. My
# recommended setup would be to source it from your bashrc/zshrc file and
# run `mail` to call the function when needed.
#
# To run from fish, you'll need to add a bash/zsh shebang to the top of the
# file, call the function from the bottom of the file, and run this file as a
# script.
#
# Dependencies:
#
# - himalaya
# - fzf
# - jq
# - w3m

preview_height() {
	if (( LINES > 30 )); then
		echo "80%"
	else
		echo "50%"
	fi
}

mail() {
  old_IFS=$IFS

  IFS=$'\n'
  accounts=($(himalaya -o json accounts | jq -r 'map(.name) | join("\n")'))
  accounts_count="${#accounts[@]}"

  account_file="${TMPDIR:-/tmp}/fzhim_account"
  query_file="${TMPDIR:-/tmp}/fzhim_qry"

  if [[ -f "$account_file" ]]; then
    current_account=$(cat "$account_file")

    if [[ ! " ${accounts[*]} " =~ " ${current_account} " ]]; then
      rm -f "$account_file"
      current_account="${accounts[@]:0:1}"
    fi
  else
    current_account="${accounts[@]:0:1}"
  fi
  echo $current_account >| $account_file

  search_query='
    IFS=$'\''\n'\'' accounts=($(echo "'"$(IFS=$'\n'; echo "${accounts[*]}")"'"))
    current_account=$(cat "'"${account_file}"'")

    if (( ${#accounts[@]} > 1 )); then
      accounts_header="${#accounts[@]} accounts:"
      for account in "${accounts[@]}"; do
        if [ "${account}" = "${current_account}" ]; then
          prefix="*\x1b[22;1m"
        else
          prefix=""
        fi
        accounts_header+=" ${prefix}${account}\x1b[0m"
      done
      echo -e "$accounts_header (ctrl-h / ctrl-l to switch)"
    fi

    if [[ "{q}" = "'\'''\''" || "{q}" = "$(echo {)q}" ]]; then
      cmd="list"
      query=""
    else
      cmd="search"
      if [[ -f "'${query_file}'" ]]; then
        query=$(eval "echo {q}")
      else
        query="OR OR SUBJECT {q} FROM {q} BODY {q}"
      fi
    fi
    if [[ `uname` == "Darwin" ]]; then
      script -t 0 -q /dev/null himalaya --account "${current_account}" "$cmd" -s 100 --max-width "'$(tput cols)'" $query | tail -n +2
    else
      script -q -f -e --command "himalaya --account "${current_account}" "$cmd" -s 100 --max-width "'$(tput cols)'" $query" /dev/null | tail -n +2
    fi
  '

  read_email='
    current_account=$(cat "'"${account_file}"'")

    himalaya --account "${current_account}" read {1} -t html \
      | w3m -T text/html -cols $FZF_PREVIEW_COLUMNS -o display_link_number=1
  '

  account_previous='
    IFS=$'\''\n'\'' accounts=($(echo "'"$(IFS=$'\n'; echo "${accounts[*]}")"'"))
    current_account=$(cat "'"${account_file}"'")

    for i in ${!accounts[@]}; do
      if [[ "${accounts[$i]}" = "${current_account}" ]]; then
        if (( i > 0 )); then
          new_account="${accounts[$i - 1]}"
          echo $new_account >| '$account_file'
        fi
      fi
    done
  '

  account_next='
    IFS=$'\''\n'\'' accounts=($(echo "'"$(IFS=$'\n'; echo "${accounts[*]}")"'"))
    current_account=$(cat "'"${account_file}"'")

    for i in ${!accounts[@]}; do
      if [[ "${accounts[$i]}" = "${current_account}" ]]; then
        if (( i < ${#accounts[@]} - 1 )); then
          new_account="${accounts[$i + 1]}"
          echo $new_account >| '$account_file'
        fi
      fi
    done
  '

  SHELL=/bin/bash FZF_DEFAULT_COMMAND="$search_query" fzf \
    --disabled \
    --bind "enter:change-preview:$read_email" \
    --bind "enter:+reload:sleep 0.4; $search_query" \
    --bind 'ctrl-j:change-preview()+down' \
    --bind 'ctrl-k:change-preview()+up' \
    --bind 'down:change-preview()+down' \
    --bind 'up:change-preview()+up' \
    --bind 'esc:change-preview()' \
    --bind 'ctrl-n:execute:himalaya --account "$(cat "'"${account_file}"'")" reply {1}' \
    --bind "ctrl-n:+reload:sleep 0.4; $search_query" \
    --bind 'ctrl-a:execute:himalaya --account "$(cat "'"${account_file}"'")" attachments {1}' \
    --bind 'ctrl-s:execute-silent:himalaya --account "$(cat "'"${account_file}"'")" flag add {1} \\seen' \
    --bind "ctrl-s:+reload:sleep 0.1; $search_query" \
    --bind 'ctrl-x:execute-silent:himalaya --account "$(cat "'"${account_file}"'")" delete {1}' \
    --bind "ctrl-x:+change-preview()+reload:sleep 0.1; $search_query" \
    --bind "ctrl-r:reload:$search_query" \
    --bind "change:change-preview()+reload:sleep 0.25; $search_query" \
    --bind "ctrl-q:change-prompt(Query > )+execute-silent:touch $query_file" \
    --bind "ctrl-f:change-prompt(> )+execute-silent:rm -f $query_file" \
    --bind "ctrl-h:change-preview()+execute-silent:$account_previous" \
    --bind "ctrl-h:+first+reload:$search_query" \
    --bind "ctrl-l:change-preview()+execute:$account_next" \
    --bind "ctrl-l:+first+reload:$search_query" \
    --preview-window "top,$(preview_height)" \
    --header "enter: read email, c-n: reply, [a]ttachments, mark [s]een, c-x: delete, [q]uery mode, c-f: normal mode, [r]eload, c-c: exit" \
    --header-lines $(( accounts_count > 1 ? 2 : 1 )) \
    --ansi

  rm -f $query_file

  IFS=$old_IFS
}
