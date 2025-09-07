# [GlazeWM]

## Config Setup

```powershell
mkdir $HOME\.glzr\glazewm
New-Item -Path $HOME\.glzr\glazewm\config.yaml -ItemType SymbolicLink -Value $HOME\dev\.config\windows\glazewm\glazewm.config.yaml
```

> [!NOTE]
> Use [WinSpy++](https://github.com/strobejb/winspy) to help detect window specs when defining rules.

## Installation

```powershell
winget install GlazeWM
```

[GlazeWM]: https://github.com/glzr-io/glazewm
