# ShelOptim helper: network stack soft reset
$ErrorActionPreference = 'Continue'
ipconfig /flushdns
netsh winsock reset
netsh int ip reset
Write-Output "Network reset commands issued. REBOOT recommended."
