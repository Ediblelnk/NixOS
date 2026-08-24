case $1 in
    -f|--find)
        kitty -e sh -c "file=\$(fzf); setsid xdg-open \"\$file\" > /dev/null 2>&1 & sleep 0.1"
        ;;
    *)
        echo "Usage: $0 [-f|--find]"
        exit 1
        ;;
esac
