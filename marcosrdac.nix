let
  url = "https://github.com/marcosrdac/nixcfg";
  src =  builtins.fetchGit {
    inherit url;
    rev = "8380568c162801340a5777843c94155eb380f037";
    ref = "main";
  };
in
{
  files.docs."/gh-pages/src/marcosrdac.md".modules = [
    # "${src}/modules/common/host/default.nix"
    # "${src}/modules/common/packages/default.nix"
    # "${src}/modules/common/typeface/default.nix"
    # "${src}/modules/home-manager/cloud/dropbox/default.nix"
    # "${src}/modules/home-manager/gui/default.nix"
    "${src}/modules/home-manager/gui/bars/polybar/default.nix"
    "${src}/modules/home-manager/gui/managers/bspwm/default.nix"
    "${src}/modules/home-manager/gui/managers/xfce/default.nix"
    # "${src}/modules/home-manager/typeface/default.nix"
    "${src}/modules/nixos/audio/default.nix"
    "${src}/modules/nixos/booting/default.nix"
    "${src}/modules/nixos/encription/default.nix"
    "${src}/modules/nixos/graphics/default.nix"
    "${src}/modules/nixos/gui/default.nix"
    "${src}/modules/nixos/keyboard/default.nix"
    "${src}/modules/nixos/mouse/default.nix"
    "${src}/modules/nixos/network/default.nix"
    "${src}/modules/nixos/permissions/default.nix"
    "${src}/modules/nixos/printer/default.nix"
    "${src}/modules/nixos/typeface/default.nix"
    "${src}/modules/nixos/typeface/default.nix"
    "${src}/modules/nixos/variables/default.nix"
  ];
  files.mdbook.summary = ''
    ---
    - [Marcos](./marcosrdac.md)
  '';
  about.sources = "- [Marcos](${url})";
}
