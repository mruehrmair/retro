$binDir = Join-Path $PSScriptRoot "bin"
$srcDir = Join-Path $PSScriptRoot "src"

if (-not (Test-Path -Path $binDir)) {
    New-Item -ItemType Directory -Path $binDir | Out-Null
}

Get-ChildItem -Path $srcDir -Filter "*.bas" | ForEach-Object {
    $source = $_.FullName
    $dest = "{0}.prg" -f $_.BaseName
    $output = Join-Path $binDir $dest

    Write-Output $source
    Write-Output $dest
    & petcat -w2 -o $output -- $source
}
