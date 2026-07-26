
param(
    [Parameter()]
    [string]$Filter = ""
    )
$build_scripts = Get-ChildItem -Filter build.ps1 -Path subjects -File

if ($Filter)
{
    $build_scripts = $build_scripts | Where-Object { $_ -match $Filter }
}

foreach($build_script in $build_scripts) {
    Write-Host "Calling $($build_script.FullName)"
    & $build_script
}