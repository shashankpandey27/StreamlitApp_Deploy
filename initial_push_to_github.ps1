# Define variables
$repoURL = "https://github.com/shashankpandey27/StreamlitApp_Deploy.git"  # Replace with your GitHub repo URL
$commitMessage = "Initial commit - Streamlit app setup"

# Navigate to project directory
cd C:\Users\spande46\Downloads\streamlit_app

# Initialize Git repository (if not already initialized)
if (!(Test-Path ".git")) {
    Write-Output "Initializing Git repository..."
    git init
}

# Set Git remote (if not already set)
$remoteExists = git remote -v
if ($remoteExists -notmatch "origin") {
    Write-Output "Adding remote repository..."
    git remote add origin $repoURL
}

# Add all files to Git
Write-Output "Adding files..."
git add .

# Commit changes
Write-Output "Committing changes..."
git commit -m $commitMessage

# Set branch to main (if not already set)
git branch -M main

# Push to GitHub
Write-Output "Pushing to GitHub..."
git push -u origin main

Write-Output "✅ Successfully pushed Streamlit app to GitHub!"
