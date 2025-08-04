# COLOR := "033[1;36m"
# NC := "033[0m"

build:
    just stow
    @echo -e "\033[1;36m[info]: building system\033[0m"
    sudo nixos-rebuild switch --flake .

dry:
    @echo -e "\033[1;36m[info]: dry-building system\033[0m"
    sudo nixos-rebuild dry-build --flake .

update:
    @echo -e "\033[1;36m[info]: updating packages\033[0m"
    sudo nix flake update --flake .

upgrade:
    just update
    just build

powerwash:
    @echo -e "\033[1;36m[info]: powerwashing system\033[0m"
    sudo nix-collect-garbage -d
    just build

stow:
    @echo -e "\033[1;36m[info]: stowing files\033[0m"
    stow .