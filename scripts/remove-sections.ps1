# PowerShell script to remove specific sections from markdown files
# Removes content from named sections until the next section with same heading level

param(
    [string]$Directory = "$PSScriptRoot\..",
    [string[]]$Sections = @("References", "Changelog")
)

Get-ChildItem -Path $Directory -Filter "*.md" -File | ForEach-Object {
    $file = $_
    $content = Get-Content -Path $file.FullName -Raw
    $originalContent = $content

    foreach ($sectionName in $Sections) {
        # Find the heading level (number of #) for this section
        # Match any #+ followed by space and the section name
        $headingMatch = [regex]::Match($content, "(#+)\s+" + [regex]::Escape($sectionName) + "$", [System.Text.RegularExpressions.RegexOptions]::Multiline)
        
        if ($headingMatch.Success) {
            $headingLevel = $headingMatch.Groups[1].Value
            $numHashes = $headingLevel.Length
            
            # Build pattern that matches from this heading until next heading of same or higher level
            # Pattern: #+ followed by space, then section name, then everything until next #+ or end
            # The lookahead ensures we stop at the next heading (same or higher level)
            $pattern = "(" + $headingLevel + "\s+" + [regex]::Escape($sectionName) + "[\s\S]*?)(?=" + ("#{" + $numHashes + "}\s+|\z") + ")"
            
            $content = $content -replace $pattern, ""
        }
    }

    # Clean up multiple consecutive empty lines
    $content = $content -replace '(\r?\n){3,}', "`r`n`r`n"

    # Clean up any leading/trailing whitespace
    $content = $content.Trim()

    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -NoNewline
        Write-Host "Removed sections from: $($file.Name)"
    } else {
        Write-Host "No changes: $($file.Name)"
    }
}

Write-Host "`nDone!"
