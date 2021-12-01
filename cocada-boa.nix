let
  url = "https://github.com/thiagokokada/nix-configs.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "da045ffb9b7a1aaa5c889431624347e89e7fb9a4";
  };
in
{
  config.files.docs."/gh-pages/src/cocada-boa.md".modules = [
    "${src}/modules/theme.nix"
    "${src}/modules/meta.nix"
    "${src}/modules/device.nix"
    "${src}/modules/nixos/neovim.nix"
    "${src}/modules/home-manager/xsettingsd.nix"
  ];
  config.files.mdbook.summary = ''
    ---
    - [Cocada Boa](./cocada-boa.md)
  '';
  config.about.sources = "- [Thiago Okada](${url})";
}
