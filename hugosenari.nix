let
  url = "https://github.com/hugosenari/nixos-config.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "f9c6f191191c4af02c118ada411c91de3720fab4";
  };
in
{
  files.docs."/gh-pages/src/hugosenari.md".modules = [
    "${src}/hm-modules/espanso.nix"
    "${src}/hm-modules/moe.nix"
    "${src}/hm-modules/spacevim.nix"
  ];
  files.mdbook.summary = ''
    ---
    - [Hugosenari](./hugosenari.md)
  '';
  about.sources = "- [Hugo Ribeiro](${url})";
}
