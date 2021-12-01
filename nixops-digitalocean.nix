{ config, lib, ...}:
let
  url = "https://github.com/nix-community/nixops-digitalocean.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "b527b4bd27a419753e38c8231fd7528b3ea33886";
  };
in
{
  config.about.sources = "- [NixOps DigitalOcean](${url})";
  config.files.docs."/gh-pages/src/nixops-digitalocean.md".modules = [
    "${src}/nixops_digitalocean/nix/droplet.nix"
  ];

  config.files.mdbook.summary = ''
    ---
    - [NixOps DigitalOcean](./nixops-digitalocean.md)
  '';
}
