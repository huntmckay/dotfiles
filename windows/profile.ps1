<#
This is a bit jank right now follow the steps
Set-ExecutionPolicy -Scope Process Bypass
iex $profile
#>
$ProgressPreference = "SilentlyContinue"
Set-PsReadlineOption -Editmode Emacs

#New-Item -Path $HOME\.ssh\config -ItemType File -ErrorAction Continue
#iwr https://github.com/neovim/neovim/releases/latest/download/nvim-win64.zip -OutFile nvim-win64.zip

set-alias "e" -Value "C:\Users\hunter.s.mckay\nvim-win64\nvim-win64\nvim.exe"
set-alias "s" -Value "get-childitem"
set-alias "unzip" -Value "Expand-Archive"
set-alias "edit-ssh" -Value "e $HOME\.ssh\config"
