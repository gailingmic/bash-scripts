#!/bin/bash
#Copyright 11.11.13 Michell Gailing <gailing.michell@gmail.com>
#It's Licensed under DWWWI 'Do whatever you want with it!' 
wget http://www.okean.com/chinacidr.txt
sed -i '1,4d' chinacidr.txt
sed -i 's/  China//g' chinacidr.txt
ipset create china hash:net
while read line; do ipset add china $line; done < chinacidr.txt
iptables -I INPUT -m set --match-set china src -j DROP
rm chinacidr.txt
