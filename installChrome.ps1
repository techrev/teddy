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
    $chromeProcRun = Get-Process -Id $chromeProcId
    $isDone = $chromeProcRun.HasExited
    while (!$isDone) {
        "Sleeping for 30 seconds........"
        Start-Sleep -s 30
        $isDone = $chromeProcRun.HasExited
        "isDone is $isDone"
    }
    $eCode = $chromeProcRun.ExitCode
    "chromeProcRun.ExitCode is $eCode"
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
       
        "Install did not complete properly"
    }
} else {
    "Could not find chrome installer in $pwd"
}