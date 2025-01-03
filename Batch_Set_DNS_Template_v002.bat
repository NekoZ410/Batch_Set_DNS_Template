:: Guide:
:: Step 1: Open cmd, type 'netsh interface show interface' to get all Network Interface Name (NIN)
:: Step 2: Change <NIN> to your current Network Interface Name you are using, <DNS> to DNS address, <INDEX> to corresponding insert order
:: Step 3: Save and run as administrator permission
:: (DON'T confuse hardware NIN with virtual NIN if you are using some VPN or bridging services)

:: 1st address: 
:: 	  			netsh interface ipv4 SET dnsservers "<NIN>" source=static address=<DNS> register=both validate=yes
:: 			Ex: netsh interface ipv4 SET dnsservers "Wi-Fi 1" source=static address=8.8.8.8 register=both validate=yes
:: 2nd address (and forward):
::    			netsh interface ipv4 ADD dnsservers "<NIN>" address=<DNS> index=<INDEX> validate=yes
:: 			Ex: netsh interface ipv4 ADD dnsservers "Wi-Fi 1" address=8.8.4.4 index=2 validate=yes
:: (Replace ipv4 to ipv6 for IPV6 DNS profile, use ipv6 addresses)

:: Some popular DNS server:
:: DNS SERVER NAME 				| IPv4 1st 		| IPv4 2nd 		| IPV6 1st 				| IPv6 2nd
:: dns.google 					| 8.8.8.8 		| 8.8.4.4 		| 2001:4860:4860::8888 	| 2001:4860:4860::8844
:: one.one.one.one 				| 1.1.1.1 		| 1.0.0.1 		| 2606:4700:4700::1111 	| 2606:4700:4700::1001
:: dns.adguard-dns.com (default)| 94.140.14.14 	| 94.140.15.15 	| 2a10:50c0::ad1:ff 	| 2a10:50c0::ad2:ff

:: Interface: 

:: Other interfaces:

:: Notification after everything were set up:
msg * DNS configurated succesfully!