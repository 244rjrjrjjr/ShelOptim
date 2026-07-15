# ShelOptim helper: create restore point
param([string]$Description = "ShelOptim manual restore point")
try {
    Checkpoint-Computer -Description $Description -RestorePointType MODIFY_SETTINGS
    Write-Output "Restore point created: $Description"
} catch {
    Write-Output "Failed: $_"
    Write-Output "Enable System Restore and run as Admin."
}
