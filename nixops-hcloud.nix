{ config, lib, ...}:
let
  src =  builtins.fetchGit {
    url = "https://github.com/nix-community/nixops_hcloud.git";
    rev = "83e182cb849f599da35e0df8a7908a2edf617751";
  };
  importModule = path: import "${src}/${path}" {
    inherit lib config;
    name = "{name}"; uuid = "{uuid}";
  };
in
{
  config.files.docs."/gh-pages/src/nixops-hcloud.md".modules = [
    "${src}/bootstrap/fetchHetznerKeys.nix"
    "${src}/nixops_hcloud/nix/hcloud.nix"
    (importModule "nixops_hcloud/nix/hcloud_sshkey.nix")
  ];
  config.files.docs."/gh-pages/src/nixops-hcloud-volume.md".modules = [
    (importModule "nixops_hcloud/nix/hcloud_volume.nix")
  ];

  config.files.mdbook.summary = ''
    ---
    - [NixOps HCloud](./nixops-hcloud.md)
    - [NixOps HCloud Volume](./nixops-hcloud-volume.md)
  '';
}
