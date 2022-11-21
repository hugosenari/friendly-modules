let
  url = "https://github.com/hugosenari/nixos-config.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "5ce39a2eaa82c870e7c2a32374920c7110757660";
  };
in
{
  files.docs."/gh-pages/src/hugosenari.md".modules = [
    "${src}/hugosenari/espanso.nix"
    "${src}/hugosenari/moe.nix"
  ];
  files.mdbook.summary = ''
    ---
    - [Hugosenari](./hugosenari.md)
  '';
  about.sources = "- [Hugo Ribeiro](${url})";
}
