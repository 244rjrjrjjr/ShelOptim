# ShelOptim helper: export system info
$out = Join-Path $PSScriptRoot "..\..\ShelOptimData\sysinfo.txt"
if (-not (Test-Path (Split-Path $out))) {
    $out = Join-Path $env:TEMP "ShelOptim_sysinfo.txt"
}
"=== ShelOptim System Info $(Get-Date) ===" | Out-File $out
systeminfo | Out-File $out -Append
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsHardware, CsProcessors, CsTotalPhysicalMemory |
    Format-List | Out-File $out -Append
Write-Output "Saved: $out"
