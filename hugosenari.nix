let
  url = "https://github.com/hugosenari/nixos-config.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "2c006fb2539bd2c6d92c73d8738ea696ec682ea5";
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
