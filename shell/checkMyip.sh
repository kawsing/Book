#!/bin/bash
#author:kawsing
GW=$(ip r s default | cut -d " " -f3)
ext_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
IP=$(ip -o route get "8.8.8.8" 2>/dev/null | sed -e 's/^.* src \([^ ]*\) .*$/\1/')  
echo "我的主機 IP 是 ${IP}"
echo "我的主機閘道 IP 是 ${GW}"
echo "我的WAN IP 是 ${ext_IP}"
