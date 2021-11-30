{ config, lib, ...}:
let
  src =  builtins.fetchGit {
    url = "https://github.com/nix-community/impermanence.git";
    rev = "0616c64b0ebcf08cc74db7820e74b807274246f6";
  };
in
{
  config.files.docs."/gh-pages/src/impermanence.md".modules = [
    "${src}/nixos.nix"
  ];
  config.files.docs."/gh-pages/src/impermanence-hm.md".modules = [
    "${src}/home-manager.nix"
  ];

  config.files.mdbook.summary = ''
    ---
    - [Impermanence](./impermanence.md)
    - [Impermanence HM](./impermanence-hm.md)
  '';
}
