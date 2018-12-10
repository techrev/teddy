$exeName = "chrome64_67.0.3396.79.exe"
$origPath = $pwd
$fileDetails = Get-ChildItem $pwd | findstr -i $exeName
if ($fileDetails -ne $null) {
    "Starting chrome installer`n"
    $chromeProc = Start-Process $exeName -ArgumentList "/silent", "/install" -PassThru
    $chromeHdl = $chromeProc.Handle
    $chromeProcId = Get-Process -Name "chrome*" | select -expand id
    $chromeProcRun = Get-Process -Id $chromeProcId
    $isDone = $chromeProcRun.HasExited
    while (!$isDone) {
        "Sleeping for$again 30 seconds to allow installer to finish........"
        Start-Sleep -s 30
        $isDone = $chromeProcRun.HasExited
        $again = " another"
    }
} else {
    "Could not find chrome installer in $pwd"
}