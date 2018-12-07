$url = "http://www.slimjetbrowser.com/chrome/win/chrome64_67.0.3396.79.exe"
$exeName = "chrome64_67.0.3396.79.exe"

$path = Join-Path $pwd $exeName
"Downloading [$url]`nSaving at [$path]`n"
Invoke-WebRequest -Uri $url -OutFile $path
"Download complete`n"
$fileDetails = Get-ChildItem $pwd | findstr -i $exeName
"Chrome installer executable is $fileDetails`n"
if ($fileDetails -ne $null) {
    "Starting chrome installer`n"
    Start-Process $exeName -ArgumentList "silent", "install"
    if ($? -eq $true) {
        "Install complete"
    } else {
        "Install did not complete properly"
    }
} else {
    "Could not find chrome installer in $pwd"
}
