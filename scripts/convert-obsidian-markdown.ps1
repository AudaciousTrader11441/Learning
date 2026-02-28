# PowerShell script to convert Obsidian-flavored markdown to plain markdown
# Converts wiki-style internal links [[link]] and [[link|text]] to markdown [text](link.md)

param(
    [string]$Directory = "$PSScriptRoot\.."
)

Get-ChildItem -Path $Directory -Filter "*.md" -File | ForEach-Object {
    $file = $_
    $content = Get-Content -Path $file.FullName -Raw

    $originalContent = $content

    # Convert wiki-link with alias [[link|text]] to markdown [text](link.md)
    $content = $content -replace '\[\[([^|\]]+)\|([^\]]+)\]\]', '[$2]($1.md)'

    # Convert wiki-link without alias [[link]] to markdown [link](link.md)
    $content = $content -replace '\[\[([^\]]+)\]\]', '[$1]($1.md)'

    # Clean up multiple consecutive empty lines
    $content = $content -replace '(\r?\n){3,}', "`r`n`r`n"

    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -NoNewline
        Write-Host "Converted: $($file.Name)"
    } else {
        Write-Host "No changes: $($file.Name)"
    }
}

Write-Host "`nConversion complete!"
