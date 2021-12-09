let
  url = "https://github.com/xtruder/kubenix.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "473a18371d2c0bb22bf060f750589695fb7d3100";
  };
in
{
  files.docs."/gh-pages/src/cocada-boa.md".modules = [
    "${src}/modules/default.nix"
  ];
  files.mdbook.summary = ''
    ---
    - [KubeNix](./kubenix.md)
  '';
  about.sources = "- [KubeNix]](${url})";
}
