#!/bin/bash

# Change this path if you're local repository is located somewhere else
cd ~/dynamic-ip-github-tracker

PUBLIC_IP_ADDR=$(curl ipinfo.io/ip)
PREVIOUS_IP_ADDR=$(cat current_ip_address.txt)

echo "IP Address: $PUBLIC_IP_ADDR"

if [ "$PUBLIC_IP_ADDR" = "$PREVIOUS_IP_ADDR" ]; then
  echo "IP has not changed. Exiting."
  return 0;
fi


echo "Saving updated IP Address"
echo "$PUBLIC_IP_ADDR" > current_ip_address.txt

git add current_ip_address.txt
git commit -m "Update IP Address"
git push

