#!/bin/bash
counter=1
threshold=20
while read -r url filename tail; do
  curl -s --connect-timeout 5 -o"./tmp/$filename" "$url"
  wdiff -s "./tmp/$filename" "./baseline/$filename" > ./results/$filename
  cat ./results/$filename | grep "% changed" > ./results/change.txt
  change=$(head -n 1 ./results/change.txt)
  spacesplitarr=( $change )
  changepercent=${spacesplitarr[10]}
  empt=""
  result=${changepercent//%/$empt}
  echo $result > ./results/$filename
  if [ $result -gt $threshold ]
  then
    echo "Please check $url"
    echo "Please check $url More than $threshold % change detected." | ./notify.sh
  fi
  rm ./results/change.txt
  lineCount=$(cat ./urls.list | wc -l)
  echo "($counter/$lineCount): $filename done. $result % Change."
  counter=$((counter+1))
done < urls.list
