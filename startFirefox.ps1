$nodePath = "C:\ProgramData\nvs\node\11.4.0\x64"
$nvsDir = Get-ChildItem -Path $nodePath
"nvs directory listing is $nvsDir"
# "Starting karma server"
$path = Join-Path $nodePath "node.exe"
"path to node is $path"
"working directory is $pwd"
$karmaFFPath = Join-Path $pwd "node_modules\karma-firefox-launcher"
$karmaServerPath = Join-Path $pwd "node_modules\karma\lib"
$karmaHtml2JsPath = Join-Path $pwd "node_modules\karma-html2js-preprocessor\lib"
$karmaConnectPath = Join-Path 4pwd "node_modules\connect"
$subFile = Join-Path $pwd "subs/index.js"
$serverFile = Join-Path $pwd "subs/server.js"
$html2JsFile = Join-Path $pwd "subs/html2js.js"
$connectFile = Join-Path $pwd "subs/connect/index.js"
"Copying $subFile to $karmaFFPath"
Copy-Item $subFile -Destination $karmaFFPath
"Copying $serverFile to $karmaServerPath"
Copy-Item $serverFile -Destination $karmaServerPath
"Copying $html2JsFile to $karmaHtml2JsPath"
Copy-Item $html2JsFile -Destination $karmaHtml2JsPath
"Copying $connectFile to $karmaConnectPath"
Copy-Item $connectFile -Destination $karmaConnectPath
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

