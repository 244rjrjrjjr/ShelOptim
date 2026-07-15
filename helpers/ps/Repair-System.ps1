# ShelOptim helper: SFC + DISM (long)
Write-Output "Starting SFC..."
sfc /scannow
Write-Output "Starting DISM RestoreHealth..."
DISM /Online /Cleanup-Image /RestoreHealth
Write-Output "Done. Review output above."
