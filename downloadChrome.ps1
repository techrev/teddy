﻿$url = "http://www.slimjetbrowser.com/chrome/win/chrome64_67.0.3396.79.exe"
$exeName = "chrome64_67.0.3396.79.exe"

$path = Join-Path $pwd $exeName
"Downloading [$url]`nSaving at [$path]`n"
Invoke-WebRequest -Uri $url -OutFile $path
"Download complete`n"