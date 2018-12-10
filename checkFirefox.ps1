$origPath = $pwd
$ffPath = "C:\Program Files\Mozilla Firefox"
Set-Location -Path $ffPath
"working directory is $pwd"
$ffDir = Get-ChildItem
"contents of ff directory:`n$ffDir"
Set-Location -Path $origPath