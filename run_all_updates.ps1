# Run the first script to push the app to GitHub for the first time
Write-Output "Running update_push_to_github.ps1..."
powershell -ExecutionPolicy Bypass -File "C:\Users\spande46\Downloads\streamlit_app\update_push_to_github.ps1"

# Run the second script for future updates
Write-Output "Running pdate_and_restart_streamlit_app.ps1..."
powershell -ExecutionPolicy Bypass -File "C:\Users\spande46\Downloads\streamlit_app\update_and_restart_streamlit_app.ps1"
