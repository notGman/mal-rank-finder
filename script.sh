#!/bin/bash

LIMIT=0
MAX_LIMIT=100
RANK=1
FOUND=0
#AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36"

read -p "Enter the anime name: " anime_name

arr=()

i=0
while [ "$LIMIT" -le "$MAX_LIMIT" ]; do
	URL="https://myanimelist.net/topanime.php?limit=$LIMIT"
	res=$(curl -s "$URL")
	names=$(echo "$res" | sed -n 's/.*<a[^>]*class="hoverinfo_trigger"[^>]*>\([^<]*\)<\/a>.*/\1/p')
	scores=$(echo "$res" | sed -n 's/.*on score-label[^"]*[^>]*>\([^<]*\)<\/span>.*/\1/p')

	while IFS= read -r name && IFS= read -r score <&3; do
		arr[i]="$name|$score"
		((i++))
	done < <(echo "$names") 3< <(echo "$scores")

	LIMIT=$((LIMIT+50))
done

for entry in "${arr[@]}"; do
	IFS='|' read name score <<< "$entry"
	if [[ "${name,,}" =~ "$anime_name" ]] || [[ "${name}" =~ "$anime_name" ]]; then
		echo "Rank $RANK : $name ; Rating : ${score}"
		FOUND=$((FOUND+1))
	fi
	((RANK++))
done

if [ "$FOUND" = 0 ]; then
	echo "Anime not found!"
fi
