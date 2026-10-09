# Batch_Set_DNS_Template
Batch template to set multiple DNS addresses on multiple Network Interfaces

## Guide
* Step 1: Open cmd, type `netsh interface show interface` to get all Network Interface Name (NIN)

* Step 2: Replace `<NIN>` to your current Network Interface Name you want to set, `<DNS>` to DNS address, and `<INDEX>` to corresponding insert order

* Step 3: Save and run as Administrator privilege

> [!CAUTION]
> DON'T confuse Hardware NIN with Virtual NIN if you are using some VPN or bridging services

## Setup
* 1st address: 
  - `netsh interface ipv4 SET dnsservers name="<NIN>" address=<DNS> source=static validate=yes register=both`
  > Example: `netsh interface ipv4 SET dnsservers name="Wi-Fi 1" address=8.8.8.8 source=static validate=yes register=both`

* 2nd addresses (and forward):
  - `netsh interface ipv4 ADD dnsservers name="<NIN>" address=<DNS> index=<INDEX> validate=yes`
  > Example: `netsh interface ipv4 ADD dnsservers name="Wi-Fi 1" address=8.8.4.4 index=2 validate=yes`

> [!WARNING]
> Replace "ipv4" to "ipv6" for IPv6 DNS profiles, and use IPv6 addresses

## Advanced
* You can set variable for each `<NIN>` to resue them:
```cmd
...
:: Interface Name: Wi-Fi 1
set "NIN1=Wi-Fi 1"
echo Configured DNS for interface: %NIN1%

netsh interface ipv4 SET dnsservers name="%NIN1%" address=1.1.1.1 source=static validate=yes register=both
netsh interface ipv4 ADD dnsservers name="%NIN1%" address=1.0.0.1 index=2 validate=yes
netsh interface ipv4 ADD dnsservers name="%NIN1%" address=8.8.8.8 index=3 validate=yes

netsh interface ipv6 SET dnsservers name="%NIN1%" address=2606:4700:4700::1111 source=static validate=yes register=both
netsh interface ipv6 ADD dnsservers name="%NIN1%" address=2606:4700:4700::1001 index=2 validate=yes
netsh interface ipv6 ADD dnsservers name="%NIN1%" address=2001:4860:4860::8888 index=3 validate=yes
...
```

## Some popular DNS services:
| Services | IPv4 Prefered | IPv4 Secondary | IPv6 Prefered | IPv6 Secondary |
| :--- | :--- | :--- | :--- | :--- |
| [Google](https://developers.google.com/speed/public-dns/docs/using#addresses) | `8.8.8.8` | `8.8.4.4` | `2001:4860:4860::8888` | `2001:4860:4860::8844` |
| [Cloudflare](https://one.one.one.one/dns/#:~:text=Replace%20those%20addresses%20with%20the%201.1.1.1%20DNS%20addresses) | `1.1.1.1` | `1.0.0.1` | `2606:4700:4700::1111` | `2606:4700:4700::1001` |
| [Quad9](https://quad9.net) | `9.9.9.9` | `149.112.112.112` | `2620:fe::fe` | `2620:fe::9` |
| [Adguard (default)](https://adguard-dns.io/vi/public-dns.html#:~:text=Our%20server%20addresses) | `94.140.14.14` | `94.140.15.15` | `2a10:50c0::ad1:ff` | `2a10:50c0::ad2:ff` |
