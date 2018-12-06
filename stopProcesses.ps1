"Stopping chrome headless processes."
$chromeProcs = Get-Process -Name "chrome" | select -expand id
foreach ($procId in $chromeProcs) {
    $proc = Get-Process -Id $procId -ErrorAction SilentlyContinue;
    if ($proc.HasExited -ne $null) {
        Stop-Process $procId
    }
}