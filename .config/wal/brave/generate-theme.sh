echo "Generating Pywal Chrome theme..."

. ~/.cache/wal/colors.sh # import colors from pywal

THEME_NAME="Pywal"

DIR=$(dirname "${BASH_SOURCE[0]}")
THEME_DIR="$DIR/$THEME_NAME"

# Converts hex colors into rgb joined with comma
# #fff -> 255, 255, 255
hexToRgb() {
    # Remove '#' character from hex color #fff -> fff
    plain=${1#*#}
    printf "%d, %d, %d" 0x${plain:0:2} 0x${plain:2:2} 0x${plain:4:2}
}

prepare() {
    if [ -d $THEME_DIR ]; then
        rm -rf $THEME_DIR
    fi

    mkdir $THEME_DIR
}

background=$(hexToRgb $background)
foreground=$(hexToRgb $foreground)
accent=$(hexToRgb $color8)

generate() {
    # Theme template
    cat >"$THEME_DIR/manifest.json" <<EOF
    {
      "manifest_version": 3,
      "version": "1.0",
      "name": "$THEME_NAME Theme",
      "theme": {
        "colors": {
            "background_tab": [$background],
            "background_tab_inactive": [$background],
            "background_tab_incognito": [$background],
            "background_tab_incognito_inactive": [$background],
            "bookmark_text": [$foreground],
            "button_background": [$background],
            "frame": [$background],
            "frame_inactive": [$background],
            "frame_incognito": [$background],
            "frame_incognito_inactive": [$background],
            "ntp_background": [$background],
            "ntp_header": [$background],
            "ntp_link": [$accent],
            "ntp_text": [$foreground],
            "omnibox_background": [$background],
            "omnibox_text": [$accent],
            "tab_background_text": [$accent],
            "tab_background_text_inactive": [$accent],
            "tab_background_text_incognito": [$accent],
            "tab_background_text_incognito_inactive": [$accent],
            "tab_text": [$foreground],
            "toolbar": [$background],
            "toolbar_button_icon": [$foreground],
            "toolbar_text": [$background]
        },
        "properties": {
          "ntp_background_alignment": "bottom"
        }
      }
    }
EOF
}

prepare
generate
echo "Pywal Chrome theme generated at $THEME_DIR"
