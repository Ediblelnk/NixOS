{ ... }:
{
  # https://github.com/Alexays/Waybar
  #
  # this is because the last release of waybar
  # was 0.15 back in February 6, 2026, and since
  # then hyprland moved to lua, breaking waybar's
  # dispatchers.
  nixpkgs.overlays = [
    (final: prev: {
      waybar = (prev.waybar.override { cavaSupport = false; }).overrideAttrs (old: {
        src = prev.fetchFromGitHub {
          owner = "Alexays";
          repo = "Waybar";
          rev = "c15ec02ede4343592a59eb5c2ff4443c9c045f7c";
          hash = "sha256-mBDWjeeIuFfDZQuBxHu+EpbJ+GMbbSxpRz0WVM2N+ZI=";
        };
        buildInputs = (old.buildInputs or [ ]) ++ [ prev.modemmanager ];
      });
    })
  ];
}
