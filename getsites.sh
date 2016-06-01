#!/bin/bash
while read -r url filename tail; do
  curl --connect-timeout 5 -o "baseline/$filename" "$url"
done < urls.list

