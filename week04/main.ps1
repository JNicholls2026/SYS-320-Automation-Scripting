# Dot-source the function file
. C:\Users\jnicholls\SYS-320-Automation-Scripting\week05\Apache-Logs.ps1

. C:\Users\jnicholls\SYS-320-Automation-Scripting\week05\Apache-Logs2.ps1

# Find all Chrome users who visited "index.html" and got HTTP 404
#$result = Get-ApacheLogs -Page "index.html" -HttpCode "404" -Browser "Chrome"
$result = ApacheLogs1

# Show results
$result