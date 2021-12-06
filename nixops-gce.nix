{ config, lib, ...}:
let
  url = "https://github.com/nix-community/nixops-gce.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "712453027486e62e087b9c91e4a8a171eebb6ddd";
  };
in
{
  about.sources = "- [NixOps GCE](${url})";
  files.docs."/gh-pages/src/nixops-gce.md".modules = [
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

  files.mdbook.summary = ''
    ---
    - [NixOps GCE](./nixops-gce.md)
  '';
}
