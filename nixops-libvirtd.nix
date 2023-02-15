{ config, lib, ...}:
let
  url = "https://github.com/nix-community/nixops-libvirtd.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "1245280d97e0adc4643d02d1cf62ddd582c73e49";
  };
  importModule = path: import "${src}/${path}" {
    inherit lib config;
    name = "{name}"; uuid = "{uuid}";
  };
in
{
  about.sources = "- [NixOps LibVirtd](${url})";
  files.docs."/gh-pages/src/nixops-libvirtd.md".modules = [
    "${src}/nixops_virtd/nix/libvirtd.nix"
  ];

  files.mdbook.summary = ''
    ---
    - [NixOps LibVirtd](./nixops-libvirtd.md)
  '';
}
