$exeName = "chrome64_67.0.3396.79.exe"
$origPath = $pwd
$fileDetails = Get-ChildItem $pwd | findstr -i $exeName
"Chrome installer executable is $fileDetails`n"
if ($fileDetails -ne $null) {
    "Starting chrome installer`n"
    $chromeProc = Start-Process $exeName -ArgumentList "/silent", "/install" -PassThru
    $chromeHdl = $chromeProc.Handle
    $chromeProcId = Get-Process -Name "chrome*" | select -expand id
    "Chrome install process Id is $chromeProcId"
    $eCode = $chromeProc.ExitCode
    if ($eCode -eq 0) {
        "Install sucessfully completed`nChecking for existence of path and executable"
        $exePath = "C:\Program Files (x86)\Google\Chrome\Application"
        $exeName = "chrome.exe"
        Set-Location -Path $exePath
        "working directory is $pwd"
        $chromeLoc = Get-ChildItem $exePath | findstr -i "chrome.exe"
        "chrome exe is $chromeLoc"
        Set-Location -Path $origPath
    } else {
        "chromeProc.ExitCode is $eCode"
        "Install did not complete properly"
    }
} else {
    "Could not find chrome installer in $pwd"
}