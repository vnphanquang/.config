# Arch Linux Specific Configuration

## Installation

Add these additional apps to install (vi pacman):

```
linux-headers
git github-cli tk openssh gnupg rust python man
xorg-server xorg-xinit xterm xorg-xev xdg-utils xdotool xclip
pipewire wiremix
thunar thunar-archive-plugin xarchiver thunar-media-tags-plugin tumbler ntfs-3g gvfs inetutils
ttf-firacode-nerd powerline powerline-fonts noto-fonts-cjk noto-fonts-emoji less
tmux alacritty fish fisher starship zoxide eza peek bat fzf fd direnv
neovim ueberzug unzip imagemagick ripgrep
i3-wm picom polybar rofi dunst maim feh playerctl htop earlyoom
firefox speech-dispatcher mpv
okular
rsync rclone
```

> [!IMPORTANT]
> Also add the correct video driver according to current hardware.

## Post Installation

### Launching i3

1. Generate a temporary `.xinitrc`:

   ```bash
   echo "exec i3" > ~/.xinitrc
   ```

2. Launch i3 with `startx`. Opt to use the default config for now!

### Configure Default Browser

1.  Set `firefox` as the default browser:

        ```bash
        xdg-settings set default-web-browser firefox.desktop
        ```

2.  Open `firefox` within x & i3, perform login & setup as needed.
3.  Change download folder to `~/downloads` instead of `/Downloads`.

### Setting up Centralized Configuration

1. Login to `github`, setting up SSH keys if necessary:

```bash
gh auth login
```

2. Clone the repo:

```bash
git clone git@github.com:vnphanquang/.config.git
```

### Configure X

```bash
ln -sf $HOME/dev/.config/x/.Xresources $HOME/.Xresources
ln -sf $HOME/dev/.config/x/.xinitrc $HOME/.xinitrc
```

> [!IMPORTANT]
> To reload `.Xresources`, run `xrdb ~/.Xresources`

> [!NOTE]
> To test key ID for binding, run:
>
> ```bash
> xev -event keyboard | egrep -o 'keycode.*\)'
> ```

### Continue App-specific Setups

1. Install [paru](https://github.com/Morganamilo/paru) first to manage AUR packages.

```bash
paru -Sy xmousepasteblock light bar-gmail volta polypane datagrip lefthook
```

2.  Move on to each of the dedicated README for each app:
    - [alacritty](../alacritty/README.md)
    - [fish](../fish/README.md)
    - [tmux](../tmux/README.md)
    - [rofi](../rofi/README.md)
    - [polybar](../i3/README.md)
    - [dunst](../dunst/README.md)
    - [i3](../i3/README.md)
    - [fcitx](../fcitx/README.md)

3.  Other apps with additional manual post-installation setup:

        ```bash
        paru -Sy nordvpn-bin docker docker-compose discord google-chrome
        ```

        For discord, [disable SKIP_HOST_UPDATE](https://wiki.archlinux.org/title/Discord#Discord_asks_for_an_update_not_yet_available_in_the_repository)

## Dual Boot Windows

Assuming:

- using the `btrfs` file system,
- using `systemd-boot` as the bootloader,
- having Windows live on a separate disk (otherwise should already be automated detected).

1. Check `lsblk -f` and mount the Windows EFI partition:

   ```bash
   sudo mkdir -p /mnt/windows-efi
   sudo mount /dev/sd... /mnt/windows-efi
   ```

2. Copy `Windows` directory to the Linux EFI partition / subvolume:

   ```bash
   sudo cp -r /mnt/windows-efi/EFI/Microsoft /boot/EFI/
   ```

3. Restart, verify that Windows is detected in the boot menu.

## AutoLogin with Getty

Credit: https://jackcuthbert.dev/blog/automated-login-in-arch-linux

```bash
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
```

```conf
# /etc/systemd/system/getty@tty1.service.d/override.conf
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin USERNAME_HERE --noclear %I $TERM
```

## Sensors & [Fan Control](https://wiki.archlinux.org/title/Fan_speed_control)

```bash
paru -S lm_sensors coolercontrol
```

Check out [lm_sensors wiki page](https://wiki.archlinux.org/title/Lm_sensors) to learn more about
configuring and detecting sensors, and [coolercontrol docs](https://docs.coolercontrol.org/) for
setting up fan profiles.

### [AsRock B650M-HDV/M.2](https://www.asrock.com/mb/AMD/B650M-HDVM.2/)

For `sensors` work correctly with this board, add `/etc/modules-load.d/nct6775.conf`:

```conf
# Load nct6775 driver
nct6775
```

## [Speed Dispatcher](https://wiki.archlinux.org/title/Speech_dispatcher) & Screen Reader

```bash
paru -S speech-dispatcher espeakup orca
```

Use [piper](https://github.com/rhasspy/piper) for tts model. Install and configured via [pied](https://github.com/Elleo/pied)!

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

## OBS

#### Dependencies

```bash
paru obs-studio v4l2loopback-dkms linux-headers
```

#### Virtual Camera

```bash
sudo modprobe v4l2loopback
```

```bash
ln -sf $HOME/dev/.config/etc/modprobe.d/v4l2loopback.conf /etc/modprobe.d/v4l2loopback.conf
ln -sf $HOME/dev/.config/etc/modules-load.d/v4l2loopback.conf /etc/modules-load.d/v4l2loopback.conf
```

#### Virtual Microphone

```bash
# create virutal sink
pactl load-module module-null-sink sink_name="VirtualSpeaker" sink_properties=device.description=VirtualSpeaker
pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name="VirtualMic" channel_map=front-left,front-right

# link
pw-link VirtualSpeaker:monitor_FL VirtualMic:input_FL
pw-link VirtualSpeaker:monitor_FR VirtualMic:input_FR

# loopback, optional
pactl load-module module-loopback sink_name="LoopbackSync" source="VirtualSpeaker.monitor"
```

## [Rclone](https://rclone.org/)

`~/.config/rclone/rclone.conf`:

```
[gdrive]
# see: https://rclone.org/drive/
description = Syncing linux machines <-> Google Drive
type = drive
scope = drive.file
root_folder_id = <...>
export_formats = docx,xlsx,pptx,svg,md,json
import_formats = md,docx,json
allow_import_name_change = true
token = <...>
team_drive =
```
