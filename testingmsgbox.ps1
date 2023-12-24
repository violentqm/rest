Add-Type -AssemblyName System.Windows.Forms

$title = "Gay"
$text = "Hello"
$buttons = [System.Windows.Forms.MessageBoxButtons]::RetryCancel
$icon = [System.Windows.Forms.MessageBoxIcon]::Information

$result = [System.Windows.Forms.MessageBox]::Show($text, $title, $buttons, $icon)

if ($result -eq [System.Windows.Forms.DialogResult]::Retry) {
    Write-Host "Retry option selected"
} elseif ($result -eq [System.Windows.Forms.DialogResult]::Cancel) {
    Write-Host "Cancel option selected"
} else {
    Write-Host "Unknown option selected"
}
