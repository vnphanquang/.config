xrdb -merge ~/.Xresources

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

export XDG_CURRENT_DESKTOP=i3
export GTK_USE_PORTAL=1
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

echo "" > "$HOME/i3.log"
exec i3 -V &>> "$HOME/i3.log"

