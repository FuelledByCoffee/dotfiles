
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/half-life.omp.json" | Invoke-Expression

Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineOption -EditMode vi
