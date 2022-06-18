{ config, lib, ...}:
let
  url = "https://github.com/nix-community/impermanence.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "0616c64b0ebcf08cc74db7820e74b807274246f6";
  };
in
{
  files.docs."/gh-pages/src/impermanence.md".modules = [
    "${src}/nixos.nix"
  ];
  files.docs."/gh-pages/src/impermanence-hm.md".modules = [
    "${src}/home-manager.nix"
  ];

  files.mdbook.summary = ''
    ---
    - [Impermanence](./impermanence.md)
      - [Impermanence HM](./impermanence-hm.md)
  '';
  about.sources = "- [Impermanence](${url})";
}
