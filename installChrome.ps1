$exeName = "chrome64_67.0.3396.79.exe"
$origPath = $pwd
$fileDetails = Get-ChildItem $pwd | findstr -i $exeName
"Chrome installer executable is $fileDetails`n"
if ($fileDetails -ne $null) {
    "Starting chrome installer`n"
    Start-Process $exeName -ArgumentList "silent", "install"
    if ($? -eq $true) {
        "Install complete`nChecking information after install:"
        $exePath = "C:\Program Files (x86)\Google\Chrome\Application"
        $exeName = "chrome.exe"
        Set-Location -Path $exePath
        "working directory is $pwd"
        $chromeLoc = Get-ChildItem $exePath | findstr -i "chrome.exe"
        "chrome exe is $chromeLoc"
        Set-Location -Path $origPath
    } else {
        "Install did not complete properly"
    }
} else {
    "Could not find chrome installer in $pwd"
}