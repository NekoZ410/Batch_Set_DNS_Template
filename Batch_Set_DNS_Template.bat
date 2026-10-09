:: Auto check Administrative privilege
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Example:
:: Interface Name: Wi-Fi 1
:: echo Configured DNS for interface: Wi-Fi 1
:: 
:: netsh interface ipv4 SET dnsservers name="Wi-Fi 1" address=8.8.8.8 source=static validate=yes register=both
:: netsh interface ipv4 ADD dnsservers name="Wi-Fi 1" address=8.8.4.4 index=2 validate=yes
:: netsh interface ipv4 ADD dnsservers name="Wi-Fi 1" address=1.1.1.1 index=3 validate=yes
:: ...
:: 
:: netsh interface ipv6 SET dnsservers name="Wi-Fi 1" address=2001:4860:4860::8888 source=static validate=yes register=both
:: netsh interface ipv6 ADD dnsservers name="Wi-Fi 1" address=2001:4860:4860::8844 index=2 validate=yes
:: netsh interface ipv6 ADD dnsservers name="Wi-Fi 1" address=2606:4700:4700::1111 index=3 validate=yes
:: ...

:: Flush DNS Cache
echo Flushing DNS Resolver Cache...
ipconfig /flushdns >nul

:: Notification after everything were set up:
powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('DNS configured successfully!', 'Success', 'OK', 'Information')" >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo =========================================
    echo   DNS Configured Successfully!
    echo =========================================
    pause
)