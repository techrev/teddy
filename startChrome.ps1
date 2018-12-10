"Starting chrome."
$exePath = "C:\Program Files (x86)\Google\Chrome\Application"
$exeName = "chrome.exe"
$path = Join-Path $exePath $exeName
Start-Process -FilePath $path -ArgumentList "--headless", "remote-debugging-port=9333", "--enable-logging"
if ($? -ne $true) {
    "Could not start chrome"
}
