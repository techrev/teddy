"Starting chrome."
# $origPath = $pwd
$exePath = "C:\Program Files (x86)\Google\Chrome\Application"
$exeName = "chrome.exe"
# Set-Location -Path $exePath
$path = Join-Path $exePath $exeName
Start-Process -FilePath $path -ArgumentList "--headless", "remote-debugging-port=9333", "--enable-logging"
# Set-Location -Path $origPath
if ($? -ne $true) {
    "Could not start chrome"
}
