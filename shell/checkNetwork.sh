#!/bin/bash
#Author:kawsing
#Date:2012/10/15
#資料位置
#if [ -f "/cdrom/school.csv" ]; then
#cp /cdrom/school.csv /tmp/
#datafile="/tmp/school.csv"
#else
#echo "範例國小,example.tn.edu.tw,192.168.1.10,192.168.1.0/24,2001:db8:abcd::1,64,192.168.1.1,2001:db8:abcd::fffe" > /tmp/school.csv
#echo "dhcp:yes:192.168.1.50 192.168.1.200" >> /tmp/school.csv
#datafile="/tmp/school.csv"
#sudo leafpad $datafile
#fi
datafile="school.csv"
source /opt/tools/shellfontcolor.sh
#ipv4=172.16.1.15
#v4gw=172.16.0.1
#ipv6=2001:db8:abcd::1
#v6gw=2001:db8:abcd::fffe
#DGS3426=120.115.3.253
source netdata2.sh
outIPv4="168.95.1.1"
outIPv6="2001:288:7200:1::1"
outWeb="tw.yahoo.com"
outWebv6="www.ipv6.org.tw"
#domain="kawsing.tn.edu.tw"
function checkState() {
	echo "ping的連通測試...."
state=`ping -c 2 "$ipv4"`
if [ $? -eq 0 ]; then
 echo "本機IPv4......通╰（￣▽￣）╭"
else
 echo -e "${RedB}本機IPv4......不通（╯‵□′）╯︵┴─┴${Reset}"
fi
state=`ping -c 2 "$v4gw"`
if [ $? -eq 0 ]; then
 echo "IPv4的Gateway......通╰（￣▽￣）╭"
else
 echo -e "${RedB}IPv4的Gateway......不通（╯‵□′）╯︵┴─┴${Reset}"
fi
state=`ping6 -c 2 $ipv6`
if [ $? -eq 0 ]; then
 echo "本機IPv6......通╰（￣▽￣）╭"
else
 echo -e "${RedB}本機IPv6......不通（╯‵□′）╯︵┴─┴${Reset}"
fi
state=`ping6 -c 2 "$v6gw"`
if [ $? -eq 0 ]; then
 echo "IPv6的Gateway......通╰（￣▽￣）╭"
else
 echo -e "${RedB}IPv6的Gateway......不通（╯‵□′）╯︵┴─┴${Reset}"
fi
#state=`ping -c 2 "$DGS3426"`
#if [ $? -eq 0 ]; then
# echo "DGS3426......通╰（￣▽￣）╭"
#else
# echo -e "${RedB}DGS3426......不通（╯‵□′）╯︵┴─┴${Reset}"
#fi
state=`ping -c 2 "$outIPv4"`
if [ $? -eq 0 ]; then
 echo "外面的IPv4......通╰（￣▽￣）╭"
else
 echo -e "${RedB}外面的IPv4......不通（╯‵□′）╯︵┴─┴${Reset}"
fi
state=`ping6 -c 2 "$outIPv6"`
if [ $? -eq 0 ]; then
 echo "外面的IPv6......通╰（￣▽￣）╭"
else
 echo -e "${RedB}外面的IPv6......不通（╯‵□′）╯︵┴─┴${Reset}"
fi
state=`ping -c 2 "$outWeb"`
if [ $? -eq 0 ]; then
 echo "外面的網址${outWeb}......通╰（￣▽￣）╭"
else
 echo -e "${RedB}外面的網址${outWeb}......不通（╯‵□′）╯︵┴─┴${Reset}"
fi
state=`ping6 -c 2 "$outWebv6"`
if [ $? -eq 0 ]; then
 echo "外面的IPv6網址${outWebv6}......通╰（￣▽￣）╭"
else
 echo -e "${RedB}外面的IPv6網址${outWebv6}......不通（╯‵□′）╯︵┴─┴${Reset}"
fi
#DNS
echo "DNS服務測試....."
state=`dig @${ipv4} www.${domain} | grep -n1 'ANSWER SECTION'`
if [ $? -eq 0 ]; then
 echo "以IPv4來dig網址www.${domain}......有╰（￣▽￣）╭"
else
 echo -e "${RedB}以IPv4來dig網址www.${domain}......沒有（╯‵□′）╯︵┴─┴${Reset}"
fi
state=`dig @${ipv6} www.${domain} AAAA | grep -n1 'ANSWER SECTION'`
if [ $? -eq 0 ]; then
 echo "以IPv6來dig網址www.${domain}的AAAA......有╰（￣▽￣）╭"
else
 echo -e "${RedB}以IPv6來dig網址www.${domain}的AAAA......沒有（╯‵□′）╯︵┴─┴${Reset}"
fi
#WEB
echo "Web服務測試....."
state=`nc -4w 2 $ipv4 80`
if [ $? -eq 0 ]; then
 echo "IPv4的Web服務......有╰（￣▽￣）╭"
else
 echo -e "${RedB}IPv4的Web服務......沒有（╯‵□′）╯︵┴─┴${Reset}"
fi
state=`nc -6w 2 $ipv6 80`
if [ $? -eq 0 ]; then
 echo "IPv6的Web服務......有╰（￣▽￣）╭"
else
 echo -e "${RedB}IPv6的Web服務......沒有（╯‵□′）╯︵┴─┴${Reset}"
fi
}
checkState
sleep 10
