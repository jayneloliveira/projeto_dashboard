$port = 8000
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
try {
    $listener.Start()
} catch {
    Write-Error "Could not start server on port $port. Maybe it's already in use?"
    exit
}

Write-Host "Server started at http://localhost:$port/"
Write-Host "Press Ctrl+C to stop (but this will run in background)"

# Function to get MIME type
function Get-MimeType($file) {
    $ext = [System.IO.Path]::GetExtension($file).ToLower()
    switch ($ext) {
        ".html" { return "text/html" }
        ".css" { return "text/css" }
        ".js" { return "application/javascript" }
        ".png" { return "image/png" }
        ".jpg" { return "image/jpeg" }
        ".svg" { return "image/svg+xml" }
        default { return "application/octet-stream" }
    }
}

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        $path = $request.Url.LocalPath
        if ($path -eq "/") { $path = "/index.html" }
        
        $localPath = Join-Path -Path $PWD -ChildPath ($path.TrimStart('/'))
        
        if (Test-Path $localPath -PathType Leaf) {
            $content = [System.IO.File]::ReadAllBytes($localPath)
            $response.ContentType = Get-MimeType($localPath)
            $response.ContentLength64 = $content.Length
            $response.OutputStream.Write($content, 0, $content.Length)
        } else {
            $response.StatusCode = 404
            $buffer = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $response.ContentLength64 = $buffer.Length
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
        }
        $response.Close()
    } catch {
        Write-Host "Error handling request: $_"
    }
}
