$binDir = Join-Path $PSScriptRoot "bin"
$d64Dir = Join-Path $PSScriptRoot "d64"
$diskImage = Join-Path $d64Dir "oxygen-sweep.d64"

if (-not (Test-Path -Path $d64Dir)) {
    New-Item -ItemType Directory -Path $d64Dir | Out-Null
}

& c1541 -format "oxygen-sweep,1" d64 $diskImage

Get-ChildItem -Path $binDir -Filter "*.prg" | ForEach-Object {
    $source = $_.FullName
    $dest = $_.Name

    Write-Output $source
    Write-Output $dest
    & c1541 $diskImage -write $source $dest
}
