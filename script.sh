#!/bin/bash

validare_ip() {
      	while read -r line; do
		ip=$(echo "$line" | awk '{print$1}')
		host=$(echo "$line" | awk '{print $2}')

		if [[ "$ip" =~ ^[0.9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]
			echo "IP valid"
		else
			echo "IP invalid"
		fi
	done < /etc/hosts
}

validare_ip

