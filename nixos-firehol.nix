let
  url = "https://github.com/TinHead/nixos-firehol.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "5ce39a2eaa82c870e7c2a32374920c7110757660";
  };
in
{
  files.docs."/gh-pages/src/nixos-firehol.md".modules = [
    "${src}/nixos-firehol.nix"
  ];
  files.mdbook.summary = ''
    ---
    - [NixOS-FireHOL](./nixos-firehol.md)
  '';
  about.sources = "- [NixOS-FireHOL](${url})";
}
