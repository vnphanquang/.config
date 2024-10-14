# Arch Linux Specific Configuration

## AutoLogin with Getty

Credit: https://jackcuthbert.dev/blog/automated-login-in-arch-linux

```conf
# /etc/systemd/system/getty@tty1.service.d/override.conf
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin USERNAME_HERE --noclear %I $TERM
```

## Linux Natural Scrolling

> /usr/share/X11/xorg.conf.d/40-libinput.conf

```conf
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "False"
EndSection

Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
EndSection
```

## Multiple SSH for Different Github Usernames

```ini
# File ~/.ssh/config

# for github.com/vnphanquang
Host github.com-vnphanquang
  HostName github.com
  IdentityFile ~/.ssh/vnphanquang_rsa
  IdentitiesOnly yes
```

```ini
# File: <git_root>/.git/config

[remote "origin"]
  url = git@github.com-username:domain
```

