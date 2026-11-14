$files = @('index.html','home.css','about.html','about.css','skills.html','skills.css','project.html','project.css','contact.html','contact.css')
$out = New-Object System.Collections.Generic.List[string]
foreach ($f in $files) {
    $out.Add(('=' * 80))
    $out.Add("FILE: $f")
    $out.Add(('=' * 80))
    foreach ($line in (Get-Content "$PSScriptRoot\$f" -Encoding UTF8)) { $out.Add($line) }
    $out.Add('')
}
[System.IO.File]::WriteAllLines("$PSScriptRoot\all.txt", $out, [System.Text.UTF8Encoding]::new($false))
Write-Host "Done. Total lines: $($out.Count)"
