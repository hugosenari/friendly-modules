{ config, lib, pkgs, ...}:
let
  url = "https://github.com/nix-community/nixos-modules-contrib.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "81a1c2ef424dcf596a97b2e46a58ca73a1dd1ff8";
  };
  importModule = path: import "${src}/${path}" {
    inherit lib pkgs config;
    utils = {};
  };
in
{
  about.sources = "- [NixOS Modules Contrib](${url})";
  files.docs."/gh-pages/src/nixos-modules-contrib.md".modules = [
  # failing
  #  (importModule "auto-raid0/default.nix")
  #  (importModule "auto-luks/default.nix")
  ];

  files.mdbook.summary = ''
    ---
    - [NixOS Contrib](./nixos-modules-contrib.md)
  '';
}
