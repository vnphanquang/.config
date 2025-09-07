# [powershell] - `pwsh`

[Install using `winget`](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.5)

```powershell
winget search Microsoft.PowerShell
# install whatever necessary
```

## Prerequisites

| Dependency | Description  |
| ---------- | ------------ |
| [zoxide]   | smarter `cd` |

## Installation

## [Profile][powershell.profile] Setup

```powershell
New-Item -Path $PROFILE -ItemType SymbolicLink -Value $HOME\dev\.config\windows\powershell\profile.ps1
```

[zoxide]: https://github.com/ajeetdsouza/zoxide
[powershell]: https://github.com/PowerShell/PowerShell
[powershell.profile]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.5
