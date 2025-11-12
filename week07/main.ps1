clear

. "C:\Users\jnicholls\SYS-320-Automation-Scripting\week07\Event-Logs.ps1"
. "C:\Users\jnicholls\SYS-320-Automation-Scripting\week08\Email.ps1"
. "C:\Users\jnicholls\SYS-320-Automation-Scripting\week08\Scheduler.ps1"
. "C:\Users\jnicholls\SYS-320-Automation-Scripting\week08\Configuration.ps1"

# Obtaining Config
$configuration = readConfiguration

# Obtaining at risk users
$Failed = atRiskUser $configuration.Days

# Sending at risk users an email
SendAlertEmail ($Failed | Format-Table | Out-String)

# Setting the script to run daily
ChooseTimeToRun($configuration.ExecutionTime)