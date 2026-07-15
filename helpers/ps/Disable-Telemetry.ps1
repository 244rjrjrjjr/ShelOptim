# ShelOptim helper: reduce telemetry (best-effort)
$ErrorActionPreference = 'SilentlyContinue'
New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Force | Out-Null
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Value 1 -Type DWord -Force
Stop-Service DiagTrack -Force -ErrorAction SilentlyContinue
Set-Service DiagTrack -StartupType Disabled -ErrorAction SilentlyContinue
Write-Output "Telemetry policy set to basic; DiagTrack disabled if possible."
