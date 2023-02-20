Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme half-life # half-life

Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineOption -EditMode vi
