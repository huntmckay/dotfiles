#iwr https://github.com/neovim/neovim/releases/latest/download/nvim-win64.zip -OutFile nvim-win64.zip
#iwr https://github.com/neovim/neovim/releases/latest/download/nvim-win64.zip -OutFile nvim-win64.zip

# TEMPORARILY BYPASS POLICY
Set-ExecutionPolicy -Scope Process Bypass -Force

# Make the Terminal not suck 
# https://gist.github.com/tuxfight3r/60051ac67c5f0445efee
Set-PsReadLineOption -Editmode Emacs

# LINK ROAMING PROFILE (PowerShell and SSH)
$USER = 'hunter.s.mckay'
$ROME = "\\ucfgllccfs01\DEMRedirect\$USER\"
$GIT = "$ROME\MinGit-2.49.0-64-bit\minw64\bin\git.exe"

# Relink PowerShell profile
$targetProfile = "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
if (Test-Path $ROME\profile.ps1) {
    New-Item -ItemType SymbolicLink -Path $targetProfile -Target "$roamingRoot\profile.ps1" -Force
    Write-Host "Linked PowerShell profile." -ForegroundColor Green
}

# Relink SSH config
$SSHDIR = "$ROME\.ssh"
if (-not (Test-Path $SSHDIR)) { New-Item -ItemType Directory -Path $SSHDIR -Force }
if (Test-Path "$ROME\config") {
    New-Item -ItemType SymbolicLink -Path "$SSHDIR\config" -Target "$ROME\config" -Force
    Write-Host "Linked SSH config." -ForegroundColor Green
} else {
    Write-Host "Missing SSH config symlink — run startup.ps1" -ForegroundColor Yellow
}

Write-Host "[$env:COMPUTERNAME] ($env:USERNAME)" -ForegroundColor Cyan

Write-Host "Custom Functions"
function jump-cvte { ssh -F $ROME\config cvte }
function jump-cctc { ssh -F $ROME\config cctc }
function tunnel-range { ssh -ND 9999 cvte }
function rome { cd $ROME }

set-alias "e" -Value "C:\Users\hunter.s.mckay\nvim-win64\nvim-win64\nvim.exe"
set-alias "s" -Value "get-childitem"
set-alias "unzip" -Value "Expand-Archive"
set-alias "edit-ssh" -Value "e $HOME\.ssh\config"
set-alias "git" -Value "$ROME\$GIT\git.exe"



$sid = [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value
