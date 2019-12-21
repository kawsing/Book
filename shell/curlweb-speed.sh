#!/bin/bash
if [ $1 ]; then
 url=$1
else
 echo "請輸入url(exp:tw.yahoo.com)"
 read url 
fi
curl -o /dev/null -s -w \
"DNS 解析: %{time_namelookup}\n\
Client Request: %{time_connect}\n\
Server Respon: %{time_starttransfer}\n\
總花費時間: %{time_total}\n" \
"${url}"
