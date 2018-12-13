"Starting karma server"
$path = Join-Path $pwd "karma"
Start-Process -FilePath $pwd -ArgumentList "start"
$karmaStarted = $? -eq $true
"Karma started? $karmaStarted"
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
