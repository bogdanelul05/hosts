#!/bin/bash

validare_ip() {
        [[$1 =~ ^[0.9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]] && return 0 || return 1
}

while IFS= read -r line do
        [[ $line =! ^# ]] && [[ -n $line ]]; then
                ip=$(echo $line | awk '{print $1}')
                hostname=$(echo $line | awk '{print $2}')
                if validare_ip "$ip"; then
                        echo "IP valid: $ip pentru $hostname"
                else
                        echo "IP invalid: $ip pentru $hostname"
                fi
        fi
done < etc/hosts

