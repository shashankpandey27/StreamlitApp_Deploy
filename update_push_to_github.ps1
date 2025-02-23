# Define commit message (change as needed)
$commitMessage = "Updated Streamlit app with .gitignore changes"

# Navigate to project directory
cd C:\Users\spande46\Downloads\streamlit_app

# Define folders to ignore
$ignoredFolders = @("data/", "logs/", "temp/", "__pycache__/" ,"actions-runner")

# Check if .gitignore exists, if not, create it
$gitignorePath = ".gitignore"
if (-Not (Test-Path $gitignorePath)) {
    New-Item -Path $gitignorePath -ItemType File -Force
}

# Add ignored folders to .gitignore if they are not already listed
$gitignoreContent = Get-Content $gitignorePath -Raw
foreach ($folder in $ignoredFolders) {
    if ($gitignoreContent -notmatch [regex]::Escape($folder)) {
        Add-Content -Path $gitignorePath -Value "`n$folder"
    }
}

# Ensure Git stops tracking ignored folders
foreach ($folder in $ignoredFolders) {
    if (Test-Path $folder) {
        git rm -r --cached $folder 2>$null
    }
}

# Verify the remote repository (optional check)
$remoteExists = git remote -v
if ($remoteExists -notmatch "origin") {
    Write-Output "⚠️ Git remote not found! Please run initial_push_to_github.ps1 first."
    exit 1
}

# Pull latest changes before pushing updates (avoids merge conflicts)
Write-Output "Pulling latest changes from GitHub..."
git pull origin main

# Add all modified files, including .gitignore updates
Write-Output "Adding and committing changes..."
git add .
git commit -m $commitMessage

# Push changes to GitHub
Write-Output "Pushing updates to GitHub..."
git push origin main

Write-Output "✅ Streamlit app updated and pushed to GitHub!"
