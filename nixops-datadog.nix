{ config, lib, ...}:
let
  src =  builtins.fetchGit {
    url = "https://github.com/nix-community/nixops-datadog.git";
    rev = "07569e314c26a6fa0523f12aeafa8eb8aa80f13d";
  };
  importModule = path: import "${src}/${path}" {
    inherit lib config;
    name = "{name}"; uuid = "{uuid}";
  };
in
{
  config.files.docs."/gh-pages/src/nixops-datadog-monitor.md".modules = [
    (importModule "nix/datadog-monitor.nix")
  ];
  # error used but not defined...
  #
  # config.files.docs."/gh-pages/src/nixops-datadog-screenboard.md".modules = [
  #   (importModule "nix/datadog-screenboard.nix")
  # ];
  # config.files.docs."/gh-pages/src/nixops-timeboard.md".modules = [
  #   ({ config.graphs = [ { definition = "My defs"; title = "My Title"; }];})
  #   (importModule "nix/datadog-timeboard.nix")
  # ];

  config.files.mdbook.summary = ''
    ---
    - [NixOps Datadog](./nixops-datadog-monitor.md)
  '';
}
