{ pkgs, ...}:
let
  url = "https://github.com/TinHead/nixos-firehol.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "8e5ac4ac7d14d16efaa9325b8a47d62e4f812b3d";
  };
  pkg = pkgs.writeText "nixos-firehol.nix"
    (builtins.replaceStrings
      ["lib.mdDoc "]
      [""]
      (builtins.readFile "${src}/nixos-firehol.nix"));
in
{
  files.docs."/gh-pages/src/nixos-firehol.md".modules = [
    "${pkg}"
  ];
  files.mdbook.summary = ''
    ---
    - [NixOS-FireHOL](./nixos-firehol.md)
  '';
  about.sources = "- [NixOS-FireHOL](${url})";
}
