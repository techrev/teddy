"Starting chrome."
$origPath = $pwd
$exePath = "C:\Program Files (x86)\Google\Chrome\Application"
$exeName = "chrome.exe"
Set-Location -Path $exePath
"working directory is $pwd"
$chromeLoc = Get-ChildItem $exePath | findstr -i "chrome.exe"
"chrome executable is $chromeLoc"
$path = Join-Path $exePath $exeName
"path is $path"
Start-Process -FilePath $path -ArgumentList "--headless", "remote-debugging-port=9333", "--enable-logging"
Set-Location -Path $origPath
if ($? -ne $true) {
    "Could not start chrome"
}
