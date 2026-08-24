case "$1" in
    -u|--update)
        source ~/.cache/wal/colors.sh
        mkdir -p ~/.cache/system-resources/
        cp ~/.resources/*svg ~/.cache/system-resources/
        sed -i "s/#FF00FF/$color1/g" ~/.cache/system-resources/*
        ;;
    *)
        echo "Usage: $0 [-u|--update]"
        ;;
esac
