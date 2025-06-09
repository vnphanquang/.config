xrdb -merge ~/.Xresources

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

echo "" > "$HOME/i3.log"
exec i3 -V &>> "$HOME/i3.log"

