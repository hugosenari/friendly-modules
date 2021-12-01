{ config, lib, pkgs, options, ...}:
let
  url = "https://github.com/nix-community/nur-combined.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "3057b09fa355166e411d19d2fe4f3a71ec5f0b69";
  };
  baseArgs = {
    inherit config lib pkgs options;
  };
in
{
  config.about.sources = "- [NUR Combined](${url})";
  config.files.docs."/gh-pages/src/nur-combined.md".modules = [
    "${src}/repos/aasg/modules/programs/dma.nix"
    "${src}/repos/aasg/modules/services/cluster/ipfs-cluster.nix"
    "${src}/repos/aasg/modules/services/databases/postgresql-base-backup.nix"
    "${src}/repos/aasg/modules/services/monitoring/prometheus/exporters/bird.nix"
    "${src}/repos/aasg/modules/services/networking/dyndnsc.nix"
    "${src}/repos/aasg/modules/services/networking/matrix-appservice-irc.nix"
    "${src}/repos/aasg/modules/services/networking/trust-dns.nix"
    "${src}/repos/aasg/modules/services/networking/wireguard-systemd.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-afreakk.md".modules = [
    "${src}/repos/afreakk/modules/fzf-fork/default.nix"
    "${src}/repos/afreakk/modules/mcfly/default.nix"
  #  "${src}/repos/afreakk/modules/scheduled-rsync/default.nix"
    "${src}/repos/afreakk/modules/sdm/default.nix"
    "${src}/repos/afreakk/modules/systemd-cron/default.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-alarsyo.md".modules = [
    "${src}/repos/alarsyo/base/networking.nix"
    "${src}/repos/alarsyo/home/alacritty.nix"
    "${src}/repos/alarsyo/home/bat.nix"
    "${src}/repos/alarsyo/home/emacs.nix"
    "${src}/repos/alarsyo/home/firefox.nix"
    "${src}/repos/alarsyo/home/fish/default.nix"
    "${src}/repos/alarsyo/home/flameshot.nix"
    "${src}/repos/alarsyo/home/git.nix"
    "${src}/repos/alarsyo/home/laptop.nix"
    "${src}/repos/alarsyo/home/lorri.nix"
    "${src}/repos/alarsyo/home/rofi.nix"
    "${src}/repos/alarsyo/home/secrets/default.nix"
    "${src}/repos/alarsyo/home/ssh.nix"
    "${src}/repos/alarsyo/home/themes/default.nix"
    "${src}/repos/alarsyo/home/tmux.nix"
    "${src}/repos/alarsyo/home/tridactyl.nix"
    "${src}/repos/alarsyo/home/x/cursor.nix"
    "${src}/repos/alarsyo/home/x/default.nix"
    "${src}/repos/alarsyo/home/x/i3bar.nix"
    "${src}/repos/alarsyo/home/x/i3.nix"
    "${src}/repos/alarsyo/modules/sddm.nix"
    "${src}/repos/alarsyo/modules/wakeonwlan.nix"
    "${src}/repos/alarsyo/secrets/default.nix"
    "${src}/repos/alarsyo/services/borg-backup.nix"
    "${src}/repos/alarsyo/services/fail2ban.nix"
    "${src}/repos/alarsyo/services/fava.nix"
    "${src}/repos/alarsyo/services/gitea/default.nix"
    "${src}/repos/alarsyo/services/jellyfin.nix"
    "${src}/repos/alarsyo/services/lohr.nix"
    "${src}/repos/alarsyo/services/matrix.nix"
    "${src}/repos/alarsyo/services/miniflux.nix"
  #  "${src}/repos/alarsyo/services/monitoring.nix"
    "${src}/repos/alarsyo/services/navidrome.nix"
    "${src}/repos/alarsyo/services/nextcloud.nix"
    "${src}/repos/alarsyo/services/nuage.nix"
    "${src}/repos/alarsyo/services/paperless.nix"
    "${src}/repos/alarsyo/services/pipewire.nix"
    "${src}/repos/alarsyo/services/postgresql-backup.nix"
    "${src}/repos/alarsyo/services/restic-backup.nix"
    "${src}/repos/alarsyo/services/tailscale.nix"
    "${src}/repos/alarsyo/services/tgv.nix"
    "${src}/repos/alarsyo/services/transmission.nix"
    "${src}/repos/alarsyo/services/vaultwarden.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-ambroisie.md".modules = [
    "${src}/repos/ambroisie/lib/options.nix"
    "${src}/repos/ambroisie/home/bluetooth/default.nix"
   # "${src}/repos/ambroisie/home/comma/default.nix"
    "${src}/repos/ambroisie/home/feh/default.nix"
    "${src}/repos/ambroisie/home/firefox/default.nix"
    "${src}/repos/ambroisie/home/flameshot/default.nix"
    "${src}/repos/ambroisie/home/gammastep/default.nix"
   # "${src}/repos/ambroisie/home/gdb/default.nix"
   # "${src}/repos/ambroisie/home/gpg/default.nix"
    "${src}/repos/ambroisie/home/gtk/default.nix"
   # "${src}/repos/ambroisie/home/mail/default.nix"
    "${src}/repos/ambroisie/home/mpv/default.nix"
    "${src}/repos/ambroisie/home/nm-applet/default.nix"
   # "${src}/repos/ambroisie/home/packages/default.nix"
    "${src}/repos/ambroisie/home/power-alert/default.nix"
    "${src}/repos/ambroisie/home/terminal/default.nix"
    "${src}/repos/ambroisie/home/udiskie/default.nix"
   # "${src}/repos/ambroisie/home/wm/default.nix"
    "${src}/repos/ambroisie/home/x/default.nix"
    "${src}/repos/ambroisie/home/zathura/default.nix"
   # "${src}/repos/ambroisie/modules/default.nix"
   # "${src}/repos/ambroisie/modules/hardware/bluetooth/default.nix"
   # "${src}/repos/ambroisie/modules/hardware/ergodox/default.nix"
   # "${src}/repos/ambroisie/modules/hardware/mx-ergo/default.nix"
   # "${src}/repos/ambroisie/modules/hardware/networking/default.nix"
   # "${src}/repos/ambroisie/modules/hardware/sound/default.nix"
   # "${src}/repos/ambroisie/modules/hardware/upower/default.nix"
   # "${src}/repos/ambroisie/modules/programs/steam/default.nix"
   # "${src}/repos/ambroisie/modules/services/adblock/default.nix"
   # "${src}/repos/ambroisie/modules/services/backup/default.nix"
   # "${src}/repos/ambroisie/modules/services/blog/default.nix"
   # "${src}/repos/ambroisie/modules/services/calibre-web/default.nix"
   # "${src}/repos/ambroisie/modules/services/drone/default.nix"
   # "${src}/repos/ambroisie/modules/services/flood/default.nix"
   # "${src}/repos/ambroisie/modules/services/gitea/default.nix"
   # "${src}/repos/ambroisie/modules/services/indexers/default.nix"
   # "${src}/repos/ambroisie/modules/services/jellyfin/default.nix"
   # "${src}/repos/ambroisie/modules/services/lohr/default.nix"
   # "${src}/repos/ambroisie/modules/services/matrix/default.nix"
   # "${src}/repos/ambroisie/modules/services/miniflux/default.nix"
   # "${src}/repos/ambroisie/modules/services/monitoring/default.nix"
   # "${src}/repos/ambroisie/modules/services/navidrome/default.nix"
   # "${src}/repos/ambroisie/modules/services/nextcloud/default.nix"
   # "${src}/repos/ambroisie/modules/services/nginx/default.nix"
   # "${src}/repos/ambroisie/modules/services/nginx/sso/default.nix"
   # "${src}/repos/ambroisie/modules/services/paperless/default.nix"
   # "${src}/repos/ambroisie/modules/services/pirate/default.nix"
   # "${src}/repos/ambroisie/modules/services/podgrab/default.nix"
   # "${src}/repos/ambroisie/modules/services/postgresql-backup/default.nix"
   # "${src}/repos/ambroisie/modules/services/postgresql/default.nix"
   # "${src}/repos/ambroisie/modules/services/quassel/default.nix"
   # "${src}/repos/ambroisie/modules/services/rss-bridge/default.nix"
   # "${src}/repos/ambroisie/modules/services/sabnzbd/default.nix"
   # "${src}/repos/ambroisie/modules/services/ssh-server/default.nix"
   # "${src}/repos/ambroisie/modules/services/tlp/default.nix"
   # "${src}/repos/ambroisie/modules/services/transmission/default.nix"
   # "${src}/repos/ambroisie/modules/services/wireguard/default.nix"
   # "${src}/repos/ambroisie/modules/system/boot/default.nix"
   # "${src}/repos/ambroisie/modules/system/language/default.nix"
    "${src}/repos/ambroisie/profiles/bluetooth/default.nix"
    "${src}/repos/ambroisie/profiles/devices/default.nix"
    "${src}/repos/ambroisie/profiles/gtk/default.nix"
    "${src}/repos/ambroisie/profiles/laptop/default.nix"
    "${src}/repos/ambroisie/profiles/wm/default.nix"
    "${src}/repos/ambroisie/profiles/x/default.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-arc.md".modules = [
   # ( import "${src}/repos/arc/modules/home/base16.nix" false baseArgs)
    "${src}/repos/arc/modules/home/bitbucket.nix"
   # "${src}/repos/arc/modules/home/buku.nix"
   # "${src}/repos/arc/modules/home/display.nix"
    "${src}/repos/arc/modules/home/filebin.nix"
   # "${src}/repos/arc/modules/home/firefox.nix"
    "${src}/repos/arc/modules/home/github.nix"
    "${src}/repos/arc/modules/home/git.nix"
   # "${src}/repos/arc/modules/home/i3gopher.nix"
    "${src}/repos/arc/modules/home/imv.nix"
    "${src}/repos/arc/modules/home/kakoune.nix"
    "${src}/repos/arc/modules/home/konawall.nix"
    "${src}/repos/arc/modules/home/less.nix"
    "${src}/repos/arc/modules/home/lorri.nix"
   # "${src}/repos/arc/modules/home/mpd.nix"
    "${src}/repos/arc/modules/home/ncmpcpp.nix"
    "${src}/repos/arc/modules/home/ncpamixer.nix"
   # "${src}/repos/arc/modules/home/nix-path.nix"
    "${src}/repos/arc/modules/home/offlineimap.nix"
    "${src}/repos/arc/modules/home/pulsemixer.nix"
    "${src}/repos/arc/modules/home/rustfmt.nix"
    "${src}/repos/arc/modules/home/shell.nix"
    "${src}/repos/arc/modules/home/sshd.nix"
    "${src}/repos/arc/modules/home/ssh.nix"
   # "${src}/repos/arc/modules/home/swaylock.nix"
    "${src}/repos/arc/modules/home/syncplay.nix"
    "${src}/repos/arc/modules/home/systemd.nix"
    "${src}/repos/arc/modules/home/task.nix"
   # "${src}/repos/arc/modules/home/tridactyl.nix"
   # "${src}/repos/arc/modules/home/weechat.nix"
    "${src}/repos/arc/modules/home/xdg.nix"
   # "${src}/repos/arc/modules/misc/base16.nix"
   # "${src}/repos/arc/modules/misc/display.nix"
   # "${src}/repos/arc/modules/nixos/alsa.nix"
   # "${src}/repos/arc/modules/nixos/base16.nix"
   # "${src}/repos/arc/modules/nixos/bindings.nix"
    "${src}/repos/arc/modules/nixos/common-root.nix"
    "${src}/repos/arc/modules/nixos/crypttab.nix"
   # "${src}/repos/arc/modules/nixos/dht22-exporter.nix"
   # "${src}/repos/arc/modules/nixos/display.nix"
    "${src}/repos/arc/modules/nixos/filebin.nix"
   # "${src}/repos/arc/modules/nixos/glauth.nix"
   # "${src}/repos/arc/modules/nixos/kernel.nix"
   # "${src}/repos/arc/modules/nixos/matrix-appservices.nix"
   # "${src}/repos/arc/modules/nixos/matrix-common.nix"
   # "${src}/repos/arc/modules/nixos/matrix-synapse-appservices.nix"
    "${src}/repos/arc/modules/nixos/modprobe.nix"
    "${src}/repos/arc/modules/nixos/mosh.nix"
   # "${src}/repos/arc/modules/nixos/mutable-state.nix"
    "${src}/repos/arc/modules/nixos/pulseaudio.nix"
   # "${src}/repos/arc/modules/nixos/service-bindings.nix"
    "${src}/repos/arc/modules/nixos/systemd.nix"
   # "${src}/repos/arc/modules/nixos/wireplumber.nix"
   # "${src}/repos/arc/modules/nixos/yggdrasil.nix"
    "${src}/repos/arc/pkgs/customized/default.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-bb010g.md".modules = [
  #  "${src}/repos/bb010g/modules/home-manager/programs/pijul.nix"
    "${src}/repos/bb010g/modules/home-manager/xcompose.nix"
  #  "${src}/repos/bb010g/pkgs/development/tools/misc/edb-debugger/default.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-bendlas.md".modules = [
    "${src}/repos/bendlas/modules/programs/lsd.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-berbiche.md".modules = [
    "${src}/repos/berbiche/modules/home-manager/deadd-notification-center.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-c0deaddict.md".modules = [
    "${src}/repos/c0deaddict/hm-modules/check-battery/default.nix"
    "${src}/repos/c0deaddict/hm-modules/gnome-keyring-daemon/default.nix"
    "${src}/repos/c0deaddict/hm-modules/mako/default.nix"
    "${src}/repos/c0deaddict/hm-modules/random-wallpaper/default.nix"
    "${src}/repos/c0deaddict/hm-modules/swayidle/default.nix"
    "${src}/repos/c0deaddict/hm-modules/workrave/default.nix"
    "${src}/repos/c0deaddict/hm-modules/xdg-apps/default.nix"
    "${src}/repos/c0deaddict/modules/apt-cacher-ng/default.nix"
  #  "${src}/repos/c0deaddict/modules/duplicity/default.nix"
    "${src}/repos/c0deaddict/modules/etlegacy/default.nix"
    "${src}/repos/c0deaddict/modules/import-garmin-connect/default.nix"
    "${src}/repos/c0deaddict/modules/nginx-sso/default.nix"
    "${src}/repos/c0deaddict/modules/prometheus-nats-exporter/default.nix"
    "${src}/repos/c0deaddict/modules/prometheus-nvme-collector/default.nix"
    "${src}/repos/c0deaddict/modules/prometheus-smartmon-collector/default.nix"
    "${src}/repos/c0deaddict/modules/prometheus-unbound-exporter/default.nix"
    "${src}/repos/c0deaddict/modules/solaredge-influx/default.nix"
    "${src}/repos/c0deaddict/modules/wordpress/default.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-crazazy.md".modules = [
  #  "${src}/repos/crazazy/lib/importFromSubmodule.nix"
    "${src}/repos/crazazy/modules/bindfs/default.nix"
    "${src}/repos/crazazy/modules/home-configuration/default.nix"
    "${src}/repos/crazazy/modules/home-configuration/doom-emacs.nix"
    "${src}/repos/crazazy/modules/internet-background/default.nix"
    "${src}/repos/crazazy/modules/nix-experimental/default.nix"
    "${src}/repos/crazazy/modules/tmpfs-configuration/default.nix"
  #  "${src}/repos/crazazy/modules/users/default.nix"
  ];
  # config.files.docs."/gh-pages/src/nur-combined-crazedprogrammer.md".modules = [
  #   "${src}/repos/crazedprogrammer/modules/overrides/thinkfan.nix"
  # ];
  config.files.docs."/gh-pages/src/nur-combined-crtified.md".modules = [
    "${src}/repos/crtified/modules/libvirt.nix"
    "${src}/repos/crtified/modules/vfio.nix"
    "${src}/repos/crtified/modules/virtualisation.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-cwyc.md".modules = [
    "${src}/repos/cwyc/modules/veracrypt/default.nix"
  ];
  #config.files.docs."/gh-pages/src/nur-combined-dandellion.md".modules = [
  #  "${src}/repos/dandellion/modules/matrix-corporal.nix"
  #];
  config.files.docs."/gh-pages/src/nur-combined-dawidsowa.md".modules = [
    "${src}/repos/dawidsowa/modules/freshrss.nix"
  ];
  #config.files.docs."/gh-pages/src/nur-combined-deeunderscore.md".modules = [
  #  "${src}/repos/deeunderscore/pkgs/git-archive-all/default.nix"
  #];
  #config.files.docs."/gh-pages/src/nur-combined-demyanrogozhin.md".modules = [
  #  "${src}/repos/demyanrogozhin/modules/services/particld.nix"
  #];
  config.files.docs."/gh-pages/src/nur-combined-dguibert.md".modules = [
    "${src}/repos/dguibert/modules/qemu-user.nix"
  ];
  #config.files.docs."/gh-pages/src/nur-combined-drewrisinger.md".modules = [
  #  "${src}/repos/drewrisinger/pkgs/python-modules/scs/default.nix"
  #];
  config.files.docs."/gh-pages/src/nur-combined-dtz.md".modules = [
    "${src}/repos/dtz/modules/allvm-cache.nix"
    "${src}/repos/dtz/modules/powerline-symbols.nix"
    #"${src}/repos/dtz/pkgs/stoke/default.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-dukzcry.md".modules = [
    "${src}/repos/dukzcry/modules/bambootracker.nix"
    "${src}/repos/dukzcry/modules/gtk.nix"
    "${src}/repos/dukzcry/modules/jack.nix"
    "${src}/repos/dukzcry/modules/job.nix"
    "${src}/repos/dukzcry/modules/logitech-k380.nix"
  #  "${src}/repos/dukzcry/modules/monitor.nix"
    "${src}/repos/dukzcry/modules/nvidia.nix"
    "${src}/repos/dukzcry/modules/pipewire.nix"
    "${src}/repos/dukzcry/modules/pulseaudio.nix"
    "${src}/repos/dukzcry/modules/qt5.nix"
  #  "${src}/repos/dukzcry/modules/rkn.nix"
    "${src}/repos/dukzcry/modules/server.nix"
    "${src}/repos/dukzcry/modules/steam.nix"
    "${src}/repos/dukzcry/modules/wifi.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-emmanuelrosa.md".modules = [
    "${src}/repos/emmanuelrosa/modules/btrbk/default.nix"
    "${src}/repos/emmanuelrosa/modules/electrum-personal-server/default.nix"
    "${src}/repos/emmanuelrosa/modules/electrumx/default.nix"
    "${src}/repos/emmanuelrosa/modules/programs/fzf/default.nix"
  #  "${src}/repos/emmanuelrosa/modules/protonvpn/default.nix"
  ];
  #config.files.docs."/gh-pages/src/nur-combined-ethancedwards8.md".modules = [
  #  "${src}/repos/ethancedwards8/modules/gc.nix"
  #];
  config.files.docs."/gh-pages/src/nur-combined-fgaz.md".modules = [
    "${src}/repos/fgaz/modules/ly/default.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-heph2.md".modules = [
    "${src}/repos/heph2/modules/services/atlas.nix"
    "${src}/repos/heph2/modules/services/pounce.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-ilya-fedin.md".modules = [
    "${src}/repos/ilya-fedin/modules/cascadia-code-fallback/default.nix"
    "${src}/repos/ilya-fedin/modules/dbus-broker/default.nix"
    "${src}/repos/ilya-fedin/modules/default-emoji-font/default.nix"
    "${src}/repos/ilya-fedin/modules/io-scheduler/default.nix"
    "${src}/repos/ilya-fedin/modules/mate-wayland/default.nix"
    "${src}/repos/ilya-fedin/modules/metric-compatible-fonts/default.nix"
    "${src}/repos/ilya-fedin/modules/nixpkgs-niv/default.nix"
    "${src}/repos/ilya-fedin/modules/noto-cjk/default.nix"
    "${src}/repos/ilya-fedin/modules/unified-kernel-image/default.nix"
    "${src}/repos/ilya-fedin/modules/vscode/default.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-immae.md".modules = [
    "${src}/repos/immae/modules/duply_backup/default.nix"
    "${src}/repos/immae/modules/filesWatcher.nix"
  # "${src}/repos/immae/modules/naemon/default.nix"
    "${src}/repos/immae/modules/openarc.nix"
    "${src}/repos/immae/modules/opendmarc.nix"
    "${src}/repos/immae/modules/rsync_backup/default.nix"
    "${src}/repos/immae/modules/secrets.nix"
  # "${src}/repos/immae/modules/webapps/diaspora.nix"
  # "${src}/repos/immae/modules/webapps/etherpad-lite.nix"
    "${src}/repos/immae/modules/webapps/fiche.nix"
  # "${src}/repos/immae/modules/webapps/mastodon.nix"
  # "${src}/repos/immae/modules/webapps/mediagoblin.nix"
  # "${src}/repos/immae/modules/webapps/peertube.nix"
    "${src}/repos/immae/modules/webapps/webstats/default.nix"
    "${src}/repos/immae/modules/websites/default.nix"
  # "${src}/repos/immae/modules/websites/httpd-service-builder.nix"
  # "${src}/repos/immae/modules/websites/php-application.nix"
  # "${src}/repos/immae/overlays/nixops/hetzner_cloud.patch"
  # "${src}/repos/immae/pkgs/mpd_0_21/default_old.nix"
  ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/instantos/modules/instantlock.nix"
  #     "${src}/repos/instantos/modules/instantwm.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/ivar/yuzu/base.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/jbarthelmes/modules/fancontrol.nix"
  #     "${src}/repos/jbarthelmes/modules/papermc.nix"
  #     "${src}/repos/jbarthelmes/modules/qbittorrent-openvpn-container.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/johnazoidberg/modules/ams.nix"
  #     "${src}/repos/johnazoidberg/modules/ip-to-usb.nix"
  #     "${src}/repos/johnazoidberg/modules/prosody-filer.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/jomik/home-modules/fish.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/kampka/modules/profiles/desktop.nix"
  #     "${src}/repos/kampka/modules/profiles/headless.nix"
  #     "${src}/repos/kampka/modules/programs/direnv/default.nix"
  #     "${src}/repos/kampka/modules/programs/firefox/default.nix"
  #     "${src}/repos/kampka/modules/programs/nix-search/default.nix"
  #     "${src}/repos/kampka/modules/programs/zsh-history/default.nix"
  #     "${src}/repos/kampka/modules/services/dns-cache/default.nix"
  #     "${src}/repos/kampka/modules/services/luksopen/default.nix"
  #     "${src}/repos/kampka/modules/services/matrix/default.nix"
  #     "${src}/repos/kampka/modules/services/msmtp-mailqueue/default.nix"
  #     "${src}/repos/kampka/modules/services/msmtp-relay/default.nix"
  #     "${src}/repos/kampka/modules/services/nginx/default.nix"
  #     "${src}/repos/kampka/modules/services/nixops-auto-upgrade/default.nix"
  #     "${src}/repos/kampka/modules/services/ntp/default.nix"
  #     "${src}/repos/kampka/modules/services/systemd-failure-email/default.nix"
  #     "${src}/repos/kampka/modules/services/tmux/default.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/kapack/modules/services/batsky.nix"
  #     "${src}/repos/kapack/modules/services/bs-munge.nix"
  #     "${src}/repos/kapack/modules/services/bs-slurm.nix"
  #     "${src}/repos/kapack/modules/services/cigri.nix"
  #     "${src}/repos/kapack/modules/services/fe-slurm.nix"
  #     "${src}/repos/kapack/modules/services/my-startup.nix"
  #     "${src}/repos/kapack/modules/services/oar.nix"
  #     "${src}/repos/kapack/modules/services/phpfpm0.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/kf5grd/modules/pinephone/sxmo.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/kira-bruneau/modules/hardware/xpadneo.nix"
  #     "${src}/repos/kira-bruneau/modules/programs/bash/undistract-me.nix"
  #     "${src}/repos/kira-bruneau/modules/programs/gamemode.nix"
  #     "${src}/repos/kira-bruneau/modules/services/networking/bluetooth-autoconnect.nix"
  #     "${src}/repos/kira-bruneau/modules/services/video/replay-sorcery.nix"
  #     "${src}/repos/kira-bruneau/modules/services/x11/display-managers/lightdm-greeters/webkit2.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/kolloch/modules/jitsi/jicofo.nix"
  #     "${src}/repos/kolloch/modules/jitsi/jitsi-meet.nix"
  #     "${src}/repos/kolloch/modules/jitsi/jitsi-videobridge.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/krebs/default.nix"
  #     "${src}/repos/krebs/submodules/krops/lib/default.nix"
  #     "${src}/repos/krebs/submodules/krops/lib/types/populate.nix"
  #     "${src}/repos/krebs/submodules/krops/lib/types/posix.nix"
  #     "${src}/repos/krebs/submodules/krops/pkgs/populate/default.nix"
  #     "${src}/repos/krebs/submodules/nix-writers/lib/types.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/kreisys/modules/bobthefish.nix"
  #     "${src}/repos/kreisys/modules/cachix.nix"
  #     "${src}/repos/kreisys/modules/consul.nix"
  #     "${src}/repos/kreisys/modules/yabai.nix"
  #     "${src}/repos/kreisys/pkgs/make-bash-cli/default.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/linyinfeng/modules/programs/telegram-send.nix"
  #     "${src}/repos/linyinfeng/modules/programs/tprofile/tprofile.nix"
  #     "${src}/repos/linyinfeng/modules/services/commit-notifier.nix"
  #     "${src}/repos/linyinfeng/modules/services/dot-tar.nix"
  #     "${src}/repos/linyinfeng/modules/services/trojan.nix"
  #     "${src}/repos/linyinfeng/modules/services/vlmcsd.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/lschuermann/modules/files.nix"
  #     "${src}/repos/lschuermann/modules/wekan.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/lucasew/homes/main/modules/dummy_module.nix"
  #     "${src}/repos/lucasew/homes/main/modules/espanso.nix"
  #     "${src}/repos/lucasew/modules/cachix/system.nix"
  #     "${src}/repos/lucasew/modules/cloudflared/system.nix"
  #     "${src}/repos/lucasew/modules/hold-gc/system.nix"
  #     "${src}/repos/lucasew/modules/randomtube/system.nix"
  #     "${src}/repos/lucasew/modules/spotify/home.nix"
  #     "${src}/repos/lucasew/modules/vercel-ddns/system.nix"
  #     "${src}/repos/lucasew/nodes/vps/modules/alibot.nix"
  #     "${src}/repos/lucasew/nodes/vps/modules/pgbackup.nix"
  #     "${src}/repos/lucasew/packages/custom/emacs/magit.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/misterio/modules/hardware/argonone.nix"
  #     "${src}/repos/misterio/modules/hardware/openrgb.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/mmilata/modules/jitsi-meet.nix"
  #     "${src}/repos/mmilata/modules/jitsi-videobridge.nix"
  #     "${src}/repos/mmilata/modules/prometheus-exporters-lnd.nix"
  #     "${src}/repos/mmilata/modules/rtl.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/moredhel/home-manager/modules/crostini/core.nix"
  #     "${src}/repos/moredhel/home-manager/modules/crostini/docker.nix"
  #     "${src}/repos/moredhel/home-manager/modules/dev.nix"
  #     "${src}/repos/moredhel/home-manager/modules/home/default.nix"
  #     "${src}/repos/moredhel/home-manager/modules/unison.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/moredread/modules/throttled/default.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/noneucat/modules/pinephone/sxmo.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/onny/modules/services/iwd-autocaptiveauth.nix"
  #     "${src}/repos/onny/pkgs/services/security/opensnitch/opensnitch.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/pamplemousse/modules/services/web-apps/cryptpad.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/pborzenkov/modules/services/gonic/default.nix"
  #     "${src}/repos/pborzenkov/modules/services/vlmcsd/default.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/peel/darwin-modules/services/development/bloop.nix"
  #     "${src}/repos/peel/darwin-modules/services/networking/weechat.nix"
  #     "${src}/repos/peel/darwin-modules/services/yabai.nix"
  #     "${src}/repos/peel/modules/services/hardware/battery-notifier.nix"
  #     "${src}/repos/peel/modules/services/hardware/udiskie.nix"
  #     "${src}/repos/peel/modules/services/misc/autocutsel.nix"
  #     "${src}/repos/peel/modules/services/misc/dunst.nix"
  #     "${src}/repos/peel/modules/services/networking/weechat.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/priegger/modules/services/cachix/default.nix"
  #     "${src}/repos/priegger/modules/services/docker/default.nix"
  #     "${src}/repos/priegger/modules/services/nginx/default.nix"
  #     "${src}/repos/priegger/modules/services/opensmtpd-relay/default.nix"
  #     "${src}/repos/priegger/modules/services/prometheus/default.nix"
  #     "${src}/repos/priegger/modules/services/reresolve-dns/default.nix"
  #     "${src}/repos/priegger/modules/services/smtp-to-sendmail/default.nix"
  #     "${src}/repos/priegger/modules/services/tor/default.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/ptival/pkgs/coqPackages/nix/sources.json"
  #     "${src}/repos/ptival/pkgs/coqPackages/nix/sources.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/qchem/benchmark/module.nix"
  #     "${src}/repos/qchem/pkgs/apps/dalton/default.nix"
  #     "${src}/repos/qchem/template_module.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/rycee/hm-modules/emacs-init.nix"
  #     "${src}/repos/rycee/hm-modules/theme-base16/bat.nix"
  #     "${src}/repos/rycee/hm-modules/theme-base16/default.nix"
  #     "${src}/repos/rycee/hm-modules/theme-base16/dunst.nix"
  #     "${src}/repos/rycee/hm-modules/theme-base16/gnome-terminal.nix"
  #     "${src}/repos/rycee/hm-modules/theme-base16/gtk.nix"
  #     "${src}/repos/rycee/hm-modules/theme-base16/jq.nix"
  #     "${src}/repos/rycee/hm-modules/theme-base16/polybar.nix"
  #     "${src}/repos/rycee/hm-modules/theme-base16/rofi.nix"
  #     "${src}/repos/rycee/hm-modules/theme-base16/screen-locker.nix"
  #     "${src}/repos/rycee/hm-modules/theme-base16/xscreensaver.nix"
  #     "${src}/repos/rycee/modules/containers-docker-support.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/sehqlr/modules/p50/hm.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/shados/overlays/lua-packages/effil.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/shamilton/modules/autognirehtet.nix"
  #     "${src}/repos/shamilton/modules/create-ap.nix"
  #     "${src}/repos/shamilton/modules/day-night-plasma-wallpapers-home-manager.nix"
  #     "${src}/repos/shamilton/modules/day-night-plasma-wallpapers-nixos.nix"
  #     "${src}/repos/shamilton/modules/hamiltonsamba.nix"
  #     "${src}/repos/shamilton/modules/myvim.nix"
  #     "${src}/repos/shamilton/modules/numworks.nix"
  #     "${src}/repos/shamilton/modules/pronotebot.nix"
  #     "${src}/repos/shamilton/modules/pronote-timetable-fetch.nix"
  #     "${src}/repos/shamilton/modules/protifygotify.nix"
  #     "${src}/repos/shamilton/modules/redshift-auto.nix"
  #     "${src}/repos/shamilton/modules/rpi-fan.nix"
  #     "${src}/repos/shamilton/modules/scottslounge.nix"
  #     "${src}/repos/shamilton/modules/simplehaproxy.nix"
  #     "${src}/repos/shamilton/modules/slick-greeter.nix"
  #     "${src}/repos/shamilton/modules/sync-database.nix"
  #     "${src}/repos/shamilton/modules/tfk-api-unoconv.nix"
  #     "${src}/repos/shamilton/modules/unoconv.nix"
  #     "${src}/repos/shamilton/modules/unoconvservice.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/sikmir/modules/home-manager/programs/aerc.nix"
  #     "${src}/repos/sikmir/modules/home-manager/programs/goldendict.nix"
  #     "${src}/repos/sikmir/modules/home-manager/programs/gpxsee.nix"
  #     "${src}/repos/sikmir/modules/home-manager/programs/josm.nix"
  #     "${src}/repos/sikmir/modules/home-manager/programs/merkaartor.nix"
  #     "${src}/repos/sikmir/modules/home-manager/programs/nnn.nix"
  #     "${src}/repos/sikmir/modules/home-manager/programs/openorienteering-mapper.nix"
  #     "${src}/repos/sikmir/modules/home-manager/programs/qmapshack.nix"
  #     "${src}/repos/sikmir/modules/home-manager/programs/slack-term.nix"
  #     "${src}/repos/sikmir/modules/services/gmnisrv.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/splintah/hm-modules/mopidy.nix"
  #     "${src}/repos/splintah/hm-modules/mpdscribble.nix"
  #     "${src}/repos/splintah/hm-modules/ncmpcpp.nix"
  #     "${src}/repos/splintah/hm-modules/onedrive.nix"
  #   ];
  #   config.files.docs."/gh-pages/src/nur-combined-aaasg".modules = [
  #     "${src}/repos/syberant/modules/shell-environments/default.nix"
  #   ];
  config.files.docs."/gh-pages/src/nur-combined-tilpner.md".modules = [
    "${src}/repos/tilpner/modules/auto-tinc.nix"
    "${src}/repos/tilpner/modules/binfmt.nix"
    "${src}/repos/tilpner/modules/duplicity.nix"
    "${src}/repos/tilpner/modules/files.nix"
    "${src}/repos/tilpner/modules/hydra-poll.nix"
    "${src}/repos/tilpner/modules/unison.nix"
    "${src}/repos/tilpner/modules/user-files.nix"
    "${src}/repos/tilpner/modules/users.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-tukuan.md".modules = [
    "${src}/repos/tokudan/modules/writefreely/default.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-tox.md".modules = [
    "${src}/repos/tox/modules/services/tox-node.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-vdmeester.md".modules = [
    "${src}/repos/vdemeester/systems/modules/core/home-manager.nix"
    "${src}/repos/vdemeester/systems/modules/core/nix.nix"
    "${src}/repos/vdemeester/systems/modules/core/nur.nix"
    "${src}/repos/vdemeester/systems/modules/hardware/sane-extra-config.nixos.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/avahi.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/base.nix"
  # "${src}/repos/vdemeester/systems/modules/profiles/buildkit.nix"
  # "${src}/repos/vdemeester/systems/modules/profiles/containerd.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/desktop.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/dev.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/docker.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/gaming.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/git.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/home.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/i18n.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/ipfs.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/laptop.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/mail.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/nix-auto-update.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/printing.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/pulseaudio.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/qemu.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/scanning.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/ssh.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/syncthing.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/virtualization.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/wireguard.server.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/yubikey.nix"
    "${src}/repos/vdemeester/systems/modules/profiles/zsh.nix"
  # "${src}/repos/vdemeester/systems/modules/programs/crc.nix"
    "${src}/repos/vdemeester/systems/modules/programs/podman.nix"
  # "${src}/repos/vdemeester/systems/modules/services/athens.nix"
  # "${src}/repos/vdemeester/systems/modules/services/govanityurl.nix"
    "${src}/repos/vdemeester/systems/modules/services/nix-binary-cache.nix"
    "${src}/repos/vdemeester/systems/modules/services/wireguard.client.nix"
    "${src}/repos/vdemeester/systems/modules/virtualisation/buildkit.nix"
    "${src}/repos/vdemeester/systems/modules/virtualisation/containerd.nix"
    "${src}/repos/vdemeester/users/modules/profiles/mails.nix"
    "${src}/repos/vdemeester/users/modules/profiles/vscode.nix"
    "${src}/repos/vdemeester/users/modules/services/emacs-server.nix"
    "${src}/repos/vdemeester/users/vincent/core/git.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-vroad.md".modules = [
    "${src}/repos/vroad/modules/looking-glass-module/default.nix"
    "${src}/repos/vroad/modules/qemu-verbatim-config/default.nix"
  ];
  config.files.docs."/gh-pages/src/nur-combined-xeals.md".modules = [
    "${src}/repos/xeals/modules/services/hardware/amdgpu-common.nix"
    "${src}/repos/xeals/modules/services/hardware/amdgpu-fan.nix"
    "${src}/repos/xeals/modules/services/hardware/amdgpu-pwm.nix"
    "${src}/repos/xeals/modules/services/hardware/radeon-profile-daemon.nix"
    "${src}/repos/xeals/modules/services/x11/dunst.nix"
  ];
  #config.files.docs."/gh-pages/src/nur-combined-xe.md".modules = [
  #  "${src}/repos/xe/modules/dwm/default.nix"
  #];
  config.files.docs."/gh-pages/src/nur-combined-zeratax.md".modules = [
  # "${src}/repos/zeratax/modules/bukkit-plugins/bukkit-plugin.nix"
  # "${src}/repos/zeratax/modules/bukkit-plugins/default.nix"
  # "${src}/repos/zeratax/modules/bukkit-server.nix"
  # "${src}/repos/zeratax/modules/matrix-registration.nix"
  # "${src}/repos/zeratax/modules/nixos/systemd-unit-options.nix"
    "${src}/repos/zeratax/modules/restic.nix"
  ];

  config.files.mdbook.summary = ''
    ---
    - [NUR Combined](./nur-combined.md)
      - [afreak    ](./nur-combined-afreakk.md)
      - [alarsyo   ](./nur-combined-alarsyo.md)
      - [ambroisie ](./nur-combined-ambroisie.md)
      - [arc       ](./nur-combined-arc.md)
      - [bb010g    ](./nur-combined-bb010g.md)
      - [bendlas   ](./nur-combined-bendlas.md)
      - [berbiche  ](./nur-combined-berbiche.md)
      - [c0deaddict](./nur-combined-c0deaddict.md)
      - [crazazy   ](./nur-combined-crazazy.md)
      - [crtified  ](./nur-combined-crtified.md)
      - [cwyc      ](./nur-combined-cwyc.md)
      - [dawidsowa ](./nur-combined-dawidsowa.md)
      - [dguibert  ](./nur-combined-dguibert.md)
      - [dtz       ](./nur-combined-dtz.md)
      - [dukzcry   ](./nur-combined-dukzcry.md)
      - [emmanuel  ](./nur-combined-emmanuelrosa.md)
      - [fgaz      ](./nur-combined-fgaz.md)
      - [heph2     ](./nur-combined-heph2.md)
      - [ilya      ](./nur-combined-ilya-fedin.md)
      - [immae     ](./nur-combined-immae.md)
  '';
}
