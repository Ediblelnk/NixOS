source ~/.scripts/variables.sh

file="$HOME/.local/share/applications/$system_name.desktop"
touch "$file"
cat >"$file" <<EOF
[Desktop Entry]
Name=$system_name
Icon=$NixOS
Type=Application
NoDisplay=true
EOF
