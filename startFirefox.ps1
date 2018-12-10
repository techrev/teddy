"Starting firefox"
$exePath = "C:\Program Files\Mozilla Firefox"
$exeName = "firefox.exe"
$path = Join-Path $exePath $exeName
Start-Process -FilePath $path -ArgumentList "-headless"
if ($? -ne $true) {
    "Could not start firefox"
}
