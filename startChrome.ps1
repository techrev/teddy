"Starting chrome."
Start-Process -FilePath "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -ArgumentList "--headless", "remote-debugging-port=9333", "--enable-logging"
if ($? -ne $true) {
    "Could not start chrome"
}