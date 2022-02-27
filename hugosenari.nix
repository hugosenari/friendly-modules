let
  url = "https://github.com/hugosenari/nixos-config.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "ac59e5dab2f276cf6826edb520d9db21564626b6";
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
