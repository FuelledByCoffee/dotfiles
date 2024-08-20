Import-Module Microsoft.WinGet.CommandNotFound

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/half-life.omp.json" | Invoke-Expression

Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineOption -EditMode vi

Set-PSReadlineOption -Colors @{
   "Parameter" = [ConsoleColor]::Cyan
   "Command" = [ConsoleColor]::Green
}

function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
}
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
