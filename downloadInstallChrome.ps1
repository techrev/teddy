$url = "http://www.slimjetbrowser.com/chrome/win/chrome64_67.0.3396.79.exe"
$path = "chrome64_67.0.3396.79.exe"

$path = Join-Path $pwd $path
"Downloading [$url]`nSaving at [$path]"
Invoke-WebRequest -Uri $url -OutFile $path
"Download complete`nStarting chrome installer"
$fileDetails = Get-ChildItem $pwd | findstr -i chrome64-67.0.3396.79.exe
if ($fileDetails -ne $null) {
    Start-Process "chrome64-67.0.3393.79.exe" -ArgumentList "silent", "install"
    if ($? -eq $true) {
        "Install complete"
    } else {
        "Install did not complete properly"
    }
}
