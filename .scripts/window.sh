case $1 in
    -f|--find)
        swaync-client -cp -sw && rofi -show window
        ;;
    -o|--open)
        swaync-client -cp -sw && rofi -show drun
        ;;
    *)
        echo "Usage: $0 [-f|--find] [-o|--open]"
        exit 1
        ;;
esac
