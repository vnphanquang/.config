# autocomplete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# VI keybinding
Set-PSReadlineOption -EditMode vi
Set-PSReadLineKeyHandler -Chord 'j' -ScriptBlock {
  if ([Microsoft.PowerShell.PSConsoleReadLine]::InViInsertMode()) {
    $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    if ($key.Character -eq 'j') {
      [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
    }
    else {
      [Microsoft.Powershell.PSConsoleReadLine]::Insert('j')
      [Microsoft.Powershell.PSConsoleReadLine]::Insert($key.Character)
    }
  }
}

function ln ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

# https://github.com/ajeetdsouza/zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
