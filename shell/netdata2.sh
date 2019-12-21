datafile=myschool.csv
arr=(schoolname domain ipv4 cidr ipv6 v6mask v4gw v6gw ending)
i=0
while read line
do
 declare ${arr[$i]}="$line"
 let i=i+1
done < $datafile

echo $schoolname
echo $domain
echo $ipv4
echo $cidr
echo $ipv6
echo $v6mask
echo $v4gw
echo $v6gw
v4network=$( echo "$cidr" |  awk -F '/' '{print $1}' )
echo $v4network
v4mask=$( echo "$cidr" |  awk -F '/' '{print $2}' )
echo $v4mask
v4brc=`sipcalc $cidr | grep 'Broadcast address' | awk '{print $NF}'`
echo $v4brc
TIMESTAMP=$( nmcli -f TIMESTAMP con | grep -v 'TIMESTAMP' )
ethcard1="eth0"
v4ns2="163.26.1.1"
dhcprange="$( cat $datafile | grep "dhcp:yes" | awk -F":" '{print $NF}' )"
