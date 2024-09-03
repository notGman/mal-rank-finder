#!/bin/bash

LIMIT=0
MAX_LIMIT=100
RANK=1
FOUND=0
#AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36"

read -p "Enter the anime name: " anime_name

arr=()

while [ "$LIMIT" -le "$MAX_LIMIT" ]; do
	URL="https://myanimelist.net/topanime.php?limit=$LIMIT"
	res=$(curl -s "$URL")
	names=$(echo "$res" | sed -n 's/.*<a[^>]*class="hoverinfo_trigger"[^>]*>\([^<]*\)<\/a>.*/\1/p')
	while IFS= read -r i; do
		arr+=("$i")
	done <<< "$names"
	LIMIT=$((LIMIT+50))
done

for name in "${arr[@]}"; do
	if [[ "${name,,}" =~ "$anime_name" ]] || [[ "${name}" =~ "$anime_name" ]]; then
		echo "Rank $RANK : $name"
		FOUND=$((FOUND+1))
	fi
	((RANK++))
done

if [ "$FOUND" = 0 ]; then
	echo "Anime not found!"
fi
