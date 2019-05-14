#!/bin/bash
#
# Validate IP script
#
# Use IFS; Internal Field Separator
# https://subscription.packtpub.com/book/networking_and_servers/9781785286216/8/ch08lvl1sec69/the-ifs-and-loops
# https://stackoverflow.com/questions/7815989/need-to-break-ip-address-stored-in-bash-variable-into-octets
#
# Use set
# https://unix.stackexchange.com/questions/308260/what-does-set-do-in-this-dockerfile-entrypoint/308263

# validate ip function
validate_ip() {



	echo "You've reached the function"
	IFS=. 
	set -- $ip_input

	echo $ip_input
	
	if [[ "$#" -ne "4" ]]; then
		echo "IP address must contain 4 octets"
		exit 1
	fi
	
	for octet in $1 $2 $3 $4; do
	#	echo $octet | 
	if [[ "$?" -ne "0" ]]; do
		echo "$octet: IPv4 address cannot contain alphabet letters."
		exit 1
	elif [[ $octet -lt "0" || 
}

ip_input=$1
echo "$ip_input"


# If user input is empty, prompt again	
while [[ -z "$ip_input" ]]; do
	read -p "No IP was given. Please enter an IP address:" ip_input
	echo ""
done

# call function
validate_ip
