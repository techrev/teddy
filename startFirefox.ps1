$nodePath = "C:\ProgramData\nvs\node\11.4.0\x64"
$nvsDir = Get-ChildItem -Path $nodePath
"nvs directory listing is $nvsDir"
# "Starting karma server"
$path = Join-Path $nodePath "node.exe"
"path to node is $path"
"working directory is $pwd"
$karmaFFPath = Join-Path $pwd "node_modules\karma-firefox-launcher"
$karmaFFDir = Get-ChildItem -Path $karmaFFPath
"path to karma ff launcher is $karmaFFPath"
"karma ff launcher directory listing is $karmaFFDir"
# Start-Process -FilePath $path -WorkingDirectory $nodePath -ArgumentList "karma", "start"
# "Sleeping for 30 seconds to let karma server get fully started"
# Start-Sleep -s 30
# $karmaProcId = Get-Process -Name "node" | select -expand id
# "karmaProcId is $karmaProcId"
# if ($karmaProcId) {
#     "Starting firefox"
#     $exePath = "C:\Program Files\Mozilla Firefox"
#     $exeName = "firefox.exe"
#     $path = Join-Path $exePath $exeName
#     Start-Process -FilePath $path -ArgumentList "http://localhost:8000" "-headless"
#     if ($? -ne $true) {
#         "Could not start firefox"
#     }
#     $procId = Get-Process -Name "firefox" | select -expand id
#     "firefox PID is $procId"
# } else {
#     "Karma did not start. Did not start firefox."
# }

