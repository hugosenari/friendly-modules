{ config, lib, ...}:
let
  src =  builtins.fetchGit {
    url = "https://github.com/nix-community/nixops-digitalocean.git";
    rev = "b527b4bd27a419753e38c8231fd7528b3ea33886";
  };
in
{
  config.files.docs."/gh-pages/src/nixops-digitalocean.md".modules = [
    "${src}/nixops_digitalocean/nix/droplet.nix"
  ];

  config.files.mdbook.summary = ''
    ---
    - [NixOps DigitalOcean](./nixops-digitalocean.md)
  '';
}
