$url = "http://www.slimjetbrowser.com/chrome/win/chrome64_67.0.3396.79.exe"
$path = "chrome64_67.0.3396.79.exe"

$path = Join-Path $pwd $path
"Downloading [$url]`nSaving at [$path]"
Invoke-WebRequest -Uri $url -OutFile $path
