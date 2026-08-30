case "$1" in
    -u|--update)
        source ~/.cache/wal/colors.sh
        mkdir -p ~/.cache/system-resources/
        cp ~/.resources/*svg ~/.cache/system-resources/
        sed -i "s/#FF00FF/$color1/g" ~/.cache/system-resources/*
        ;;
    -f|--update-file)
        file=$2
        color=$3
        cp ~/.resources/$file ~/.cache/system-resources/$file
        sed -i "s/#FF00FF/$color/g" ~/.cache/system-resources/$file
        ;;
    *)
        echo "Usage: $0 [-u|--update] [-f|--update-file <file> <color>]"
        ;;
esac
