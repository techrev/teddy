"Starting chrome."
$exeName = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
Start-Process -FilePath $exeName -ArgumentList "--headless", "remote-debugging-port=9333", "--enable-logging"
if ($? -ne $true) {
    "Could not start chrome"
}