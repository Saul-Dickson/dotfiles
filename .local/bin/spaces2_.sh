export IFS="
"

for filename in $(fd -t f ' ' $HOME/Downloads/gallery-dl/); do
	mv "$filename" "${filename// /_}"
done

export IFS=" "
