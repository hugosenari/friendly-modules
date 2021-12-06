{ config, lib, ...}:
let
  url = "https://github.com/nix-community/nixops-datadog.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "07569e314c26a6fa0523f12aeafa8eb8aa80f13d";
  };
  importModule = path: import "${src}/${path}" {
    inherit lib config;
    name = "{name}"; uuid = "{uuid}";
  };
in
{
  about.sources = "- [NixOps Datadog](${url})";
  files.docs."/gh-pages/src/nixops-datadog-monitor.md".modules = [
    (importModule "nix/datadog-monitor.nix")
  ];
  # error used but not defined...
  #
  # files.docs."/gh-pages/src/nixops-datadog-screenboard.md".modules = [
  #   (importModule "nix/datadog-screenboard.nix")
  # ];
  # files.docs."/gh-pages/src/nixops-timeboard.md".modules = [
  #   ({ config.graphs = [ { definition = "My defs"; title = "My Title"; }];})
  #   (importModule "nix/datadog-timeboard.nix")
  # ];

  files.mdbook.summary = ''
    ---
    - [NixOps Datadog](./nixops-datadog-monitor.md)
  '';
}
