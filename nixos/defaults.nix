{ ... }:
{
  xdg.mime.defaultApplications = {
    # BROWSER
    "text/html" = "brave-browser.desktop";

    # EDITOR
    "text/plain" = "dev.zed.Zed.desktop";
    "text/rust" = "dev.zed.Zed.desktop";
    "text/css" = "dev.zed.Zed.desktop";
    "application/json" = "dev.zed.Zed.desktop";
    "application/schema+json" = "dev.zed.Zed.desktop";
    "application/octet-stream" = "dev.zed.Zed.desktop";

    # DOCUMENT VIEWER
    "application/pdf" = "org.gnome.Evince.desktop";

    # IMAGES
    "image/*" = "pix.desktop";
  };
}
