SCRIPT_DIR=$(
    cd "$(dirname "$0")"
    pwd
)

GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m'

cecho() {
    echo -e "$1$2$NC"
}

build-system() {
    cecho $GREEN "[slang]: building system"
    sudo nixos-rebuild switch --flake $SCRIPT_DIR
}

build() {
    build-system
}

dry-system() {
    cecho $GREEN "[slang]: dry-building system"
    sudo nixos-rebuild dry-build --flake $SCRIPT_DIR
}

dry() {
    dry-system
}

update() {
    cecho $GREEN "[slang]: updating packages"
    sudo nix flake update --flake $SCRIPT_DIR
}

powerwash() {
    cecho $GREEN "[slang]: powerwashing system"
    sudo nix-collect-garbage -d
    build
}

upgrade() {
    update
    build
}

case $1 in
update | upgrade | build-system | build | powerwash | dry-system | dry)
    $1
    ;;
*)
    cecho $RED "[slang]: unknown slang '$1'"
    ;;
esac
