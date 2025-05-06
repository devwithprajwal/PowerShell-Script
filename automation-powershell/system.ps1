# List all running processes
Get-Process

# Filter for a specific process (e.g., notepad)
Get-Process -Name <processname>

# Get detailed information about a specific process
Get-Process -Name notepad | Format-List *



