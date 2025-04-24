# Batch_Set_DNS_Template
Batch template to set multiple DNS on multiple Network Interface

## Guide
> Step 1: Open cmd, type "netsh interface show interface" to get all Network Interface Name (NIN)

> Step 2: Change [NIN] to your current Network Interface Name you are using, [DNS] to DNS address, [INDEX] to corresponding insert order

> Step 3: Save and run as Administrator permission

⚠ DON'T confuse hardware NIN with virtual NIN if you are using some VPN or bridging services

## Template
* 1st address: 
  - netsh interface ipv4 SET dnsservers "[NIN]" source=static address=[DNS] register=both validate=yes
  > Ex: netsh interface ipv4 SET dnsservers "Wi-Fi 1" source=static address=8.8.8.8 register=both validate=yes
* 2nd address (and forward):
  - netsh interface ipv4 ADD dnsservers "[NIN]" address=[DNS] index=[INDEX] validate=yes
  > Ex: netsh interface ipv4 ADD dnsservers "Wi-Fi 1" address=8.8.4.4 index=2 validate=yes

⚠ Replace "ipv4" to "ipv6" for IPV6 DNS profile, and use ipv6 addresses

## Some popular DNS servers:
* [Google](https://developers.google.com/speed/public-dns/docs/using):
  - ipv6: 8.8.8.8 | 8.8.4.4
  - ipv6: 2001:4860:4860::8888 | 2001:4860:4860::8844
* [Cloudflare (1.1.1.1)](https://one.one.one.one/dns/#:~:text=Setup%20on%20PC-,Setting%20up%201.1.1.1,-takes%20two%20minutes): 
  - ipv4: 1.1.1.1 | 1.0.0.1
  - ipv6: 2606:4700:4700::1111 | 2606:4700:4700::1001
* [Adguard (default)](https://adguard-dns.io/vi/public-dns.html#:~:text=Our%20server%20addresses):
  - ipv4: 94.140.14.14 | 94.140.15.15
  - ipv6: 2a10:50c0::ad1:ff | 2a10:50c0::ad2:ff
