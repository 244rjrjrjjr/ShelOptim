# ShelOptim helper: deep temp cleanup
$ErrorActionPreference = 'SilentlyContinue'
$paths = @(
    $env:TEMP,
    "$env:LOCALAPPDATA\Temp",
    "C:\Windows\Temp",
    "C:\Windows\Prefetch"
)
$freed = 0
foreach ($p in $paths) {
    if (-not (Test-Path $p)) { continue }
    Get-ChildItem -LiteralPath $p -Force -Recurse -ErrorAction SilentlyContinue |
        ForEach-Object {
            try {
                $s = $_.Length
                Remove-Item -LiteralPath $_.FullName -Force -Recurse -ErrorAction Stop
                $freed += $s
            } catch {}
        }
}
Write-Output ("Clean-Temp done. Approx bytes attempted free: {0}" -f $freed)
