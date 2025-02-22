Write-Output "Pulling latest code from GitHub..."
cd C:\Users\spande46\Downloads\streamlit_app
git pull origin main

Write-Output "Installing dependencies..."
pip install -r requirements.txt

Write-Output "Restarting Streamlit App..."
schtasks /end /tn "StreamlitApp"
Start-Sleep -Seconds 5
schtasks /run /tn "StreamlitApp"

Write-Output "Deployment complete!"
