#!/bin/bash

validare_ip_dns(){
	local host=$1
	local ip=$2
	local dns_server=$3
	ip_host=$(dig +short "$host" @dns_server)
	if [[ "ip_host" ==  "ip" ]]; then
		echo "IP valid"
	else
		echo "IP invalid"
	fi
}

validare_ip(){
	while read -r line; do
		ip=$(echo "$line" | awk '{print $1}')
		host=$(echo "$line" | awk '{print $2}')
		validare_ip_dns "$host" "$ip" "8.8.8.8"
	done < /etc/hosts
}

validare_ip
