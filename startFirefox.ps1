"Starting karma server"
$path = Join-Path $pwd "karma"
Start-Process -FilePath $pwd -ArgumentList "start"
"Sleeping for 30 seconds to let karma server get fully started"
Start-Sleep -s 30
$karmaProcId = Get-Process -Name "node" | select -expand id
"karmaProcId is $karmaProcId"
"Starting firefox"
$exePath = "C:\Program Files\Mozilla Firefox"
$exeName = "firefox.exe"
$path = Join-Path $exePath $exeName
Start-Process -FilePath $path -ArgumentList "http://localhost:8000" "-headless"
if ($? -ne $true) {
    "Could not start firefox"
}
$procId = Get-Process -Name "firefox" | select -expand id
"firefox PID is $procId"
