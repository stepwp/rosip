#!/bin/bash
curl -o cn.txt https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/cn.txt 
curl -o geoip.data https://raw.githubusercontent.com/Loyalsoldier/geoip/release/geoip.dat
#cat cn.txt |grep -v : |sed -e 's/^/add address=/g' -e 's/$/ list=CNIP/g'|sed -e $'1i\\\n/ip firewall address-list' -e $'1i\\\nremove [/ip firewall address-list find list=CNIP]' -e $'1i\\\nadd address=10.0.0.0/8 list=CNIP comment=private-network' -e $'1i\\\nadd address=172.16.0.0/12 list=CNIP comment=private-network' -e $'1i\\\nadd address=192.168.0.0/16 list=CNIP comment=private-network'>cnip.rsc
cat cn.txt |grep -v : |sed -e 's/^/add address=/g' -e 's/$/ list=CNIP/g'|sed -e $'1i\\\n/ip firewall address-list' -e $'1i\\\nremove [/ip firewall address-list find list=CNIP]'  -e $'1i\\\nadd address=192.168.10.0/24 list=CNIP comment=wireguard' -e $'1i\\\nadd address=192.168.2.0/24 list=CNIP comment=private-network'>cnip.rsc
