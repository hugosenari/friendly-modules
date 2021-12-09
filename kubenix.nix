{ lib, pkgs, config, options, ...}:
let
  url = "https://github.com/xtruder/kubenix.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "473a18371d2c0bb22bf060f750589695fb7d3100";
  };
in
{
  files.docs."/gh-pages/src/kubenix.md".modules = [
    ("${src}/modules/base.nix")
    ("${src}/modules/istio.nix")
    ("${src}/modules/submodule.nix")
  ];
  files.mdbook.summary = ''
    ---
    - [KubeNix](./kubenix.md)
  '';
  about.sources = "- [KubeNix]](${url})";
}
