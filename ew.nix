let 
  url = "https://github.com/lucasew/nixcfg.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "9cb8d51201c33b024ec14c23f16c69b885807b1f";
    ref = "master";
  };
in
{
  files.docs."/gh-pages/src/ew.md".modules = [
    "${src}/homes/main/dummy_module.nix"
    "${src}/homes/main/espanso.nix"
    "${src}/modules/cachix/system.nix"
    "${src}/modules/hold-gc/system.nix"
    "${src}/nodes/bootstrap/screenkey.nix"
    "${src}/nodes/common/unstore.nix"
    # "${src}/nodes/ivarstead/modules/alibot.nix"
    "${src}/nodes/ivarstead/modules/pgbackup.nix"
    # "${src}/nodes/ivarstead/modules/phputils.nix"
  ];
  files.mdbook.summary = ''
    ---
    - [Lucas](./ew.md)
  '';
  about.sources = "- [Lucas Eduardo](${url})";
}
