param(
    [Parameter(Position = 0)]
    [string]$Source
)

$fileName = Split-Path -Leaf $Source
$programPath = Join-Path (Join-Path $PSScriptRoot "bin") $fileName

Write-Output $fileName
& x64sc $programPath
