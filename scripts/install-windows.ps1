# Installation script for Cursor IDE Onboarding Commands (Windows)
# This script copies all onboarding step files to %USERPROFILE%\.cursor\commands\

# Get the directory where this script is located
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir

# Target directory
$TargetDir = Join-Path $env:USERPROFILE ".cursor\commands\onboarding"

Write-Host "Installing Cursor IDE Onboarding Commands..." -ForegroundColor Yellow
Write-Host ""

# Create target directory if it doesn't exist
if (-not (Test-Path $TargetDir)) {
    Write-Host "Creating directory: $TargetDir" -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
}

# List of files to copy
$Files = @(
    "commands\initialize\initialize.md",
    "commands\discovery\analyze-core-and-endpoints.md",
    "commands\discovery\analyze-endpoint-flows.md",
    "commands\analysis\analyze-architecture.md",
    "commands\analysis\analyze-config-and-testing.md",
    "commands\analysis\analyze-integrations.md",
    "commands\analysis\analyze-domain-and-performance.md",
    "commands\advanced\generate-quick-reference.md",
    "commands\advanced\analyze-code-structure.md",
    "commands\advanced\assess-production-readiness.md"
)

# Copy each file
$Copied = 0
$Skipped = 0

foreach ($file in $Files) {
    $SourceFile = Join-Path $RepoRoot $file
    $FileName = Split-Path -Leaf $file
    $TargetFile = Join-Path $TargetDir $FileName
    
    if (Test-Path $SourceFile) {
        if (Test-Path $TargetFile) {
            Write-Host "File already exists: $FileName" -ForegroundColor Yellow
            $overwrite = Read-Host "Overwrite? (y/N)"
            if ($overwrite -eq "y" -or $overwrite -eq "Y") {
                Copy-Item -Path $SourceFile -Destination $TargetFile -Force
                Write-Host "✓ Copied: $FileName" -ForegroundColor Green
                $Copied++
            } else {
                Write-Host "⊘ Skipped: $FileName" -ForegroundColor Yellow
                $Skipped++
            }
        } else {
            Copy-Item -Path $SourceFile -Destination $TargetFile -Force
            Write-Host "✓ Copied: $FileName" -ForegroundColor Green
            $Copied++
        }
    } else {
        Write-Host "✗ File not found: $file" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host "Copied: $Copied files" -ForegroundColor Green
if ($Skipped -gt 0) {
    Write-Host "Skipped: $Skipped files" -ForegroundColor Yellow
}
Write-Host ""
Write-Host "Files installed to: $TargetDir"
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Restart Cursor IDE if it's currently running"
Write-Host "2. Open a project workspace"
Write-Host "3. Start a new chat and type: /onboarding/initialize (REQUIRED - must run first)"
Write-Host "4. Then run any step: /onboarding/analyze-core-and-endpoints, /onboarding/analyze-endpoint-flows, etc."
Write-Host ""
Write-Host "See README.md or QUICK_START.md for detailed usage instructions."
