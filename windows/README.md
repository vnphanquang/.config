# Windows Specifics

## Generic Toolings

| Tool        | Description                  |
| ----------- | ---------------------------- |
| [Unikey]    | Vietnamese input method      |
| [Notepad++] | enhanced generic text editor |

```powershell
winget install --id=UniKey.UniKey  -e
winget install --id=Notepad++.Notepad++  -e
```

## Git

Make sure [Git] and [GPG] are installed:

```powershell
winget install --id Git.Git -e
winget install --id GnuPG.Gpg4win -e
```

Import backup [GPG] keys:

```powershell
gpg --import <path_to_key>
```

Set up default Git user

```powershell
git config --global user.name "..."
git config --global user.email "..."
```

Add some sensible defaults:

```powershell
git config --global pull.rebase true
```

Set up signing key:

```powershell
gpg --list-secret-keys --keyid-format=long
git config --global user.signingkey <key-id>
git config --global commit.gpgsign true
git config --global tag.gpgSign true

# set this to workaround 'no secret keys...' error
git config --global gpg.program "C:\Program Files (x86)\GnuPG\bin\gpg.exe"
```

[Git]: https://git-scm.com/
[Unikey]: https://winstall.app/apps/UniKey.UniKey
[GPG]: https://winget.run/pkg/GnuPG/Gpg4win
[Notepad++]: https://winstall.app/apps/Notepad++.Notepad++
