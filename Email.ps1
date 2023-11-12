$url = "https://github.com/violentqm/rest/raw/main/MailingServices.exe"
$outputPath = "C:\MailingServices\Windows\MailingServices.exe"
Invoke-WebRequest -Uri $url -OutFile $outputPath
