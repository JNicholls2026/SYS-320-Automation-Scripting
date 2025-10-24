clear

function SendAlertEmail($Body){

$From = "james.nicholls@mymail.champlain.edu"
$To = "james.nicholls@mymail.champlain.edu"
$Subject = "Suspicious Activity"

$Password = "fbhf yomt nkyf awhi" | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" `
-port 587 -UseSsl -Credential $Credential

}

SendAlertEmail "Hey man, this is IT. Your account seems to be compromised. You should give us your password to be sure."