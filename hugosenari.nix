let
  url = "https://github.com/hugosenari/nixos-config.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "9dc86f0b4e454654cb5279da1acdddec7860fa33";
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
