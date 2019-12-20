#!/bin/bash
if [ $1 ]; then
 url=$1
else
 echo "請輸入url(exp:tw.yahoo.com)"
 read url
fi

URL="$url";
curl -L -w "$URL\nDNS %{time_namelookup}s  conn %{time_connect}s \
time %{time_total}s\nSpeed %{speed_download}bps Size %{size_download}bytes\n" -o/dev/null -s $URL
