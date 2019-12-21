#!/bin/bash 
#arping -c 2 "$(echo 192.168.43.{101..200})" -I wlp4s0
for i in `seq 1 200`
do 
				arping -c 1 192.168.43.${i} -I wlp4s0 | grep 'Unicast'
done
