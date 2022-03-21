#!/usr/bin/env bash

SDIR="$HOME/.config/polybar/scripts"
ROFI_DIR="$SDIR/rofi"
COLOR_DIR="$SDIR/color"

# Launch Rofi
MENU="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
-theme $ROFI_DIR/styles.rasi \
<<< " amber| blue| blue-gray| brown| cyan| deep-orange|\
 deep-purple| green| gray| indigo| blue-light| green-light|\
 lime| orange| pink| purple| red| teal| yellow| amber-dark|\
 blue-dark| blue-gray-dark| brown-dark| cyan-dark| deep-orange-dark|\
 deep-purple-dark| green-dark| gray-dark| indigo-dark| blue-light-dark|\
 green-light-dark| lime-dark| orange-dark| pink-dark| purple-dark| red-dark| teal-dark| yellow-dark|")"
            case "$MENU" in
				## Light Colors
				*amber) "$COLOR_DIR"/cocolors-light.sh --amber ;;
				*blue) "$COLOR_DIR"/colors-light.sh --blue ;;
				*blue-gray) "$COLOR_DIR"/colors-light.sh --blue-gray ;;
				*brown) "$COLOR_DIR"/colors-light.sh --brown ;;
				*cyan) "$COLOR_DIR"/colors-light.sh --cyan ;;
				*deep-orange) "$COLOR_DIR"/colors-light.sh --deep-orange ;;
				*deep-purple) "$COLOR_DIR"/colors-light.sh --deep-purple ;;
				*green) "$COLOR_DIR"/colors-light.sh --green ;;
				*gray) "$COLOR_DIR"/colors-light.sh --gray ;;
				*indigo) "$COLOR_DIR"/colors-light.sh --indigo ;;
				*blue-light) "$COLOR_DIR"/colors-light.sh --light-blue ;;
				*green-light) "$COLOR_DIR"/colors-light.sh --light-green ;;
				*lime) "$COLOR_DIR"/colors-light.sh --lime ;;
				*orange) "$COLOR_DIR"/colors-light.sh --orange ;;
				*pink) "$COLOR_DIR"/colors-light.sh --pink ;;
				*purple) "$COLOR_DIR"/colors-light.sh --purple ;;
				*red) "$COLOR_DIR"/colors-light.sh --red ;;
				*teal) "$COLOR_DIR"/colors-light.sh --teal ;;
				*yellow) "$COLOR_DIR"/colors-light.sh --yellow ;;
				## Dark Colors
				*amber-dark) "$COLOR_DIR"/colors-dark.sh --amber ;;
				*blue-dark) "$COLOR_DIR"/colors-dark.sh --blue ;;
				*blue-gray-dark) "$COLOR_DIR"/colors-dark.sh --blue-gray ;;
				*brown-dark) "$COLOR_DIR"/colors-dark.sh --brown ;;
				*cyan-dark) "$COLOR_DIR"/colors-dark.sh --cyan ;;
				*deep-orange-dark) "$COLOR_DIR"/colors-dark.sh --deep-orange ;;
				*deep-purple-dark) "$COLOR_DIR"/colors-dark.sh --deep-purple ;;
				*green-dark) "$COLOR_DIR"/colors-dark.sh --green ;;
				*gray-dark) "$COLOR_DIR"/colors-dark.sh --gray ;;
				*indigo-dark) "$COLOR_DIR"/colors-dark.sh --indigo ;;
				*blue-light-dark) "$COLOR_DIR"/colors-dark.sh --light-blue ;;
				*green-light-dark) "$COLOR_DIR"/colors-dark.sh --light-green ;;
				*lime-dark) "$COLOR_DIR"/colors-dark.sh --lime ;;
				*orange-dark) "$COLOR_DIR"/colors-dark.sh --orange ;;
				*pink-dark) "$COLOR_DIR"/colors-dark.sh --pink ;;
				*purple-dark) "$COLOR_DIR"/colors-dark.sh --purple ;;
				*red-dark) "$COLOR_DIR"/colors-dark.sh --red ;;
				*teal-dark) "$COLOR_DIR"/colors-dark.sh --teal ;;
				*yellow-dark) "$COLOR_DIR"/colors-dark.sh --yellow
            esac
