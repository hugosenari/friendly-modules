{ lib, pkgs, config, options, ...}:
let
  url = "https://github.com/hlissner/dotfiles.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "fb0593af66ef8e560e89ea7e72699b84761597e0";
  };
  inputs = {
    agenix.nixosModules.age = {};
  };
  # options = {};
  cfg.dotfiles.dir = src;
  cfg.dotfiles.modulesDir = "${src}/modules";
  cfg.user.name = "username";
  cfg.user.home = "/tmp/userhome";
  mkDisable = name: { inherit name; value = { enable = false; }; };
  mkDisableXdg = name: { inherit name; value = { enable = false; xdg.enable = false; }; };
  mkDisabled = name: { inherit name; value = false; };
  cfg.services = builtins.listToAttrs (
    map mkDisable ["xserver"]
  );
  cfg.modules.hardware = builtins.listToAttrs (
    map mkDisable ["bluetooth" "audio" "fs" "razer" "ergodox" "nvidia" "sensors" "wacom"]
  );
  cfg.modules.services = builtins.listToAttrs (
    (map mkDisable [
      "jellyfin" "teamviewer" "vaultwarden" "docker" "syncthing" "calibre" "discourse"
      "gitea" "ssh" "transmission" "fail2ban"
    ]) ++ [
      { name = "nginx"; value = { enableCloudflareSupport = false; enable = false;}; }
    ]
  );
  cfg.modules.desktop.apps = (builtins.listToAttrs (
    (map mkDisable [
      "godot" "rofi" "skype" "unity3d" "awesomewm"
    ])
  ));
  cfg.modules.desktop.awesomewm.enable = false;
  cfg.modules.desktop.bspwm.enable = false;
  cfg.modules.desktop.stumpwm.enable = false;
  cfg.modules.desktop.browsers = builtins.listToAttrs (
    (map mkDisable [
      "brave" "firefox" "qutebrowser"
    ]) ++ [ {name = "default"; value = null;}]
  );
  cfg.modules.desktop.gaming = (builtins.listToAttrs (
    (map mkDisable [
      "steam"
    ])
  ));
  cfg.modules.desktop.media = (builtins.listToAttrs (
    (map mkDisable [
      "daw" "documents" "graphics" "mpv" "ncmpcpp" "recording" "spotify"
    ])
  ));
  cfg.modules.desktop.term = (builtins.listToAttrs (
    (map mkDisable [
      "st"
    ])
  ));
  cfg.modules.desktop.vm = (builtins.listToAttrs (
    (map mkDisable [
      "lxd" "qemu" "virtualbox"
    ])
  ));
  cfg.modules.dev = (builtins.listToAttrs (
    (map mkDisableXdg [
      "cc" "clojure" "common-lisp" "lua" "node" "python" "rust" "scala" "shell"
    ]) ++ [
      { name = "enable"; value = false; }
      { name = "enableXDG"; value = false; }
      { name ="xdg"; value = { enable = false; };}
    ]
  ));
  cfg.modules.editors = (builtins.listToAttrs (
    (map mkDisable [
      "emacs" "vim"
    ]) ++ [
      { name = "default"; value = null; }
    ]
  ));
  cfg.modules.shell = (builtins.listToAttrs (
    (map mkDisable [
      "adl" "direnv" "git" "gnupg" "pass" "tmux" "vaultwarden" "zsh"
    ])
  ));
  cfg.modules.theme = (builtins.listToAttrs (
    (map mkDisable [
      "alucard"
    ]) ++ [
      { name = "active"; value = null; }
    ]
  ));
  my = import "${src}/lib/default.nix" {
    inherit lib pkgs inputs;
  };

  # TODO: make use of eval modules to remove previus
  importModule = paths: 
    map (path: import "${src}/${path}" {
      inherit inputs pkgs my;
      config       = config // cfg;
      home-manager = {};
      lib          = lib // { inherit my; };
      options      = options // {};
    }) paths;
in
{
  files.docs."/gh-pages/src/hlissner.md".modules = importModule [
    "modules/options.nix"
    "modules/xdg.nix"
    "modules/security.nix"
    "modules/xdg.nix"
    "modules/agenix.nix"
    "modules/desktop/apps/godot.nix"
    "modules/desktop/apps/rofi.nix"
    # "modules/desktop/apps/skype.nix"
    "modules/desktop/apps/unity3d.nix"
    "modules/desktop/awesomewm.nix"
    "modules/desktop/browsers/brave.nix"
    "modules/desktop/browsers/default.nix"
    "modules/desktop/browsers/firefox.nix"
    "modules/desktop/browsers/qutebrowser.nix"
    "modules/desktop/bspwm.nix"
    "modules/desktop/default.nix"
    "modules/desktop/gaming/emulators.nix"
    "modules/desktop/gaming/steam.nix"
    "modules/desktop/media/daw.nix"
    "modules/desktop/media/documents.nix"
    "modules/desktop/media/graphics.nix"
    "modules/desktop/media/mpv.nix"
    "modules/desktop/media/ncmpcpp.nix"
    "modules/desktop/media/recording.nix"
    "modules/desktop/media/spotify.nix"
    "modules/desktop/stumpwm.nix"
    "modules/desktop/term/default.nix"
    "modules/desktop/term/st.nix"
    "modules/desktop/vm/lxd.nix"
    "modules/desktop/vm/qemu.nix"
    "modules/desktop/vm/virtualbox.nix"
    "modules/dev/cc.nix"
    "modules/dev/clojure.nix"
    "modules/dev/common-lisp.nix"
    "modules/dev/default.nix"
    "modules/dev/lua.nix"
    "modules/dev/node.nix"
    "modules/dev/python.nix"
    "modules/dev/rust.nix"
    "modules/dev/scala.nix"
    "modules/dev/shell.nix"
    "modules/editors/default.nix"
    "modules/editors/emacs.nix"
    "modules/editors/vim.nix"
    "modules/shell/adl.nix"
    "modules/shell/direnv.nix"
    "modules/shell/git.nix"
    "modules/shell/gnupg.nix"
    "modules/shell/pass.nix"
    "modules/shell/tmux.nix"
    "modules/shell/vaultwarden.nix"
    "modules/shell/zsh.nix"
    "modules/themes/alucard/default.nix"
    # "modules/themes/default.nix"
    "modules/hardware/audio.nix"
    "modules/hardware/bluetooth.nix"
    "modules/hardware/ergodox.nix"
    "modules/hardware/fs.nix"
    "modules/hardware/nvidia.nix"
    "modules/hardware/razer.nix"
    "modules/hardware/sensors.nix"
    "modules/hardware/wacom.nix"
    "modules/services/calibre.nix"
    "modules/services/discourse.nix"
    "modules/services/docker.nix"
    "modules/services/fail2ban.nix"
    "modules/services/gitea.nix"
    "modules/services/jellyfin.nix"
    "modules/services/nginx.nix"
    "modules/services/ssh.nix"
    "modules/services/syncthing.nix"
    "modules/services/teamviewer.nix"
    "modules/services/transmission.nix"
    "modules/services/vaultwarden.nix"
  ];
  files.mdbook.summary = ''
    ---
    - [hlissner](./hlissner.md)
  '';

  about.sources = "- [Henrik Lissner](${url})";
}
