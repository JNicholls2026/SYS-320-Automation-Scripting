# Get only logs that contain 404, save into $notfounds
$notfounds = Select-String '404' C:\xampp\apache\logs\access.log

#Define a regex for IP addresses
$regex = [regex]"\d{1,3}(\.\d{1,3}){3}"

#Get $notfounds records that match to the regex
$ipsUnorganized = $regex.Matches($notfounds)

#Get ips as pscustomobject
$ips =@()
for ($i = 0; $i -lt $ipsUnorganized.Count; $i++) {
    $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value }
}

#Filter for private 10.x.x.x addresses
#$ips | Where-Object { $_.IP -ilike "10.*" }

# Count ips from number 8
$ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*" }

$counts = $ipsoftens | Group-Object -Property IP

$counts | Select-Object Count, Name