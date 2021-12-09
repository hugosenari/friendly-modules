{ config, lib, pkgs, ...}:
let
  url = "https://github.com/NixOS/nixops.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "0c989d79c9052ebf52f12964131f4fc31ac20a18";
  };
  importModule = path: import "${src}/${path}" {
    inherit lib config pkgs;
    name = "{name}"; uuid = "{uuid}";
  };
in
{
  about.sources = "- [NixOps](${url})";
  files.docs."/gh-pages/src/nixops.md".modules = [
    (importModule "nix/command-output.nix")
    "${src}/nix/keys.nix"
    "${src}/nix/lib.nix"
    "${src}/nix/options.nix"
    "${src}/nix/resource.nix"
    "${src}/nix/ssh-keypair.nix"
  ];

  files.mdbook.summary = ''
    ---
    - [NixOps](./nixops.md)
  '';
}
