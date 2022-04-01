{ lib, pkgs, ...}:
let
  url = "https://github.com/hlissner/dotfiles.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "fb0593af66ef8e560e89ea7e72699b84761597e0";
  };
  inputs = {};
  options = {};
  config.dotfiles.dir = src;
  config.dotfiles.modulesDir = "${src}/modules";
  config.user.home = "/tmp/userhome";
  home-manager = {};
  my = import "${src}/lib/default.nix" {
    inherit lib pkgs inputs;
  };
  allLib = lib // { inherit my; };
  args = {
    inherit inputs config pkgs options home-manager;
    unstable = pkgs;
    lib = allLib;
  };
in
{
  files.docs."/gh-pages/src/hlissner.md".modules = [
    (import "${src}/modules/options.nix" args)
    #"${src}/modules/agenix.nix"
    #"${src}/modules/security.nix"
    #"${src}/modules/xdg.nix"
  ];
  files.mdbook.summary = ''
    ---
    - [hlissner](./hlissner.md)
  '';
  about.sources = "- [Henrik Lissner](${url})";
}
