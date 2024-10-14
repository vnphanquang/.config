xrdb -merge ~/.Xresources

echo "" > "$HOME/i3.log"
exec i3 -V &>> "$HOME/i3.log"

