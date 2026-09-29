$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$inputDir = Join-Path $PSScriptRoot 'build/package/SkinChanger'
$outputDir = Join-Path $PSScriptRoot 'dist'
$zipPath = Join-Path $outputDir 'SkinChanger-0.1.8-Lite.zip'
$files = @(
    @{ Source = (Join-Path $inputDir 'manifest.json'); Entry = 'SkinChanger/manifest.json' },
    @{ Source = (Join-Path $inputDir 'plugin.dll'); Entry = 'SkinChanger/plugin.dll' },
    @{ Source = (Join-Path $PSScriptRoot 'LICENSE'); Entry = 'SkinChanger/LICENSE.txt' }
)
foreach ($file in $files) {
    if (-not (Test-Path -LiteralPath $file.Source -PathType Leaf)) {
        throw "Missing package input: $($file.Source)"
    }
}
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
$stream = [System.IO.File]::Open($zipPath, [System.IO.FileMode]::Create)
try {
    $archive = [System.IO.Compression.ZipArchive]::new(
        $stream, [System.IO.Compression.ZipArchiveMode]::Create, $false)
    try {
        foreach ($file in $files) {
            [void][System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
                $archive, $file.Source, $file.Entry,
                [System.IO.Compression.CompressionLevel]::Optimal)
        }
        $entry = $archive.CreateEntry('SkinChanger/README.txt')
        $writer = [System.IO.StreamWriter]::new(
            $entry.Open(), [System.Text.UTF8Encoding]::new($false))
        try {
            $writer.WriteLine('SkinChanger Lite 0.1.8 by b1ank')
            $writer.WriteLine('Accessories and glider only. No clothing feature.')
            $writer.WriteLine('Copy the SkinChanger folder into Anomaly/plugins.')
            $writer.WriteLine('Source: https://github.com/kongbaibaizi/SkinChanger')
        } finally { $writer.Dispose() }
    } finally { $archive.Dispose() }
} finally { $stream.Dispose() }
Get-Item -LiteralPath $zipPath | Select-Object FullName, Length
