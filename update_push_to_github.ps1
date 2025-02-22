# Define commit message (change as needed)
$commitMessage = "Updated Streamlit app"

# Navigate to project directory
cd C:\Users\your-user\streamlit_app

# Verify the remote repository (optional check)
$remoteExists = git remote -v
if ($remoteExists -notmatch "origin") {
    Write-Output "⚠️ Git remote not found! Please run initial_push_to_github.ps1 first."
    exit 1
}

# Pull latest changes before pushing updates (avoids merge conflicts)
Write-Output "Pulling latest changes from GitHub..."
git pull origin main

# Add all modified files
Write-Output "Adding and committing changes..."
git add .
git commit -m $commitMessage

# Push changes to GitHub
Write-Output "Pushing updates to GitHub..."
git push origin main

Write-Output "✅ Streamlit app updated and pushed to GitHub!"
