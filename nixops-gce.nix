{ config, lib, ...}:
let
  src =  builtins.fetchGit {
    url = "https://github.com/nix-community/nixops-gce.git";
    rev = "712453027486e62e087b9c91e4a8a171eebb6ddd";
  };
  importModule = path: import "${src}/${path}" {
    inherit lib config;
    name = "{name}"; uuid = "{uuid}";
  };
in
{
  config.files.docs."/gh-pages/src/nixops-gce.md".modules = [
    "${src}/nixops_gcp/nix/image-options.nix"
    "${src}/nixops_gcp/nix/common-gce-options.nix"
    (import "${src}/nixops_gcp/nix/gce-credentials.nix" lib "{name}")
    # impurit error
    # "${src}/nixops_gcp/nix/gce.nix"
    # "${src}/nixops_gcp/nix/gce-target-pool.nix"
    # "${src}/nixops_gcp/nix/gce-static-ip.nix"
    # "${src}/nixops_gcp/nix/gce-routes.nix"
    # "${src}/nixops_gcp/nix/gce-network.nix"
    # "${src}/nixops_gcp/nix/gce-image.nix"
    # "${src}/nixops_gcp/nix/gce-http-health-check.nix"
    # "${src}/nixops_gcp/nix/gce-forwarding-rule.nix"
    # "${src}/nixops_gcp/nix/gce-disk.nix"
    # "${src}/nixops_gcp/nix/gse-bucket.nix"

  ];
  #config.files.docs."/gh-pages/src/nixops-hcloud-volume.md".modules = [
  #  (importModule "nixops_hcloud/nix/hcloud_volume.nix")
  #];

  config.files.mdbook.summary = ''
    ---
    - [NixOps GCE](./nixops-gce.md)
  '';
}