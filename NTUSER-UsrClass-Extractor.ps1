Write-Host -ForegroundColor Yellow "==== NTUSER & UsrClass Extractor ===="
Write-Host -ForegroundColor Yellow "==== Select Drive Root Folder"
Add-Type -AssemblyName System.Windows.Forms
$browser = New-Object System.Windows.Forms.FolderBrowserDialog
$browser.RootFolder = 'MyComputer'
$null = $browser.ShowDialog()
$kapeTargetFolder = $browser.SelectedPath
Write-Host -ForegroundColor Yellow "==== Copying NTUSERs & UsrClass from $kapeTargetFolder"

$userFolderNames = Get-ChildItem -Path "$kapeTargetFolder\Users" -Directory -Force -ErrorAction SilentlyContinue

foreach ($userFolderName in $userFolderNames) {
    $users = Split-Path "$kapeTargetFolder\Users\$($userFolderName)" -Leaf
    New-Item -Path ".\NTUser-UsrClass-Extractor\$($userFolderName.BaseName)" -ItemType Directory -force
    Copy-Item "$kapeTargetFolder\Users\$users\NTUSER.DAT" -Destination ".\NTUser-UsrClass-Extractor\$($userFolderName.BaseName)" -ErrorAction SilentlyContinue
    Copy-Item "$kapeTargetFolder\Users\$users\AppData\Local\Microsoft\Windows\UsrClass.dat" -Destination ".\NTUser-UsrClass-Extractor\$($userFolderName.BaseName)" -ErrorAction SilentlyContinue
}