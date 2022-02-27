let
  url = "https://github.com/hugosenari/nixos-config.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "48fea340e38769b1ab16e9097b6025bbc7147a6f";
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
