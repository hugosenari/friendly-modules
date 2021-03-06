let 
  url = "https://github.com/lucasew/nixcfg.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "e6f04d70c5e3a81c712ef337d21b9dccb162243a";
  };
in
{
  files.docs."/gh-pages/src/ew.md".modules = [
    "${src}/homes/main/modules/espanso.nix"
    "${src}/homes/main/modules/dummy_module.nix"
    "${src}/modules/cachix/system.nix"
    "${src}/modules/cloudflared/system.nix"
    "${src}/modules/hold-gc/system.nix"
    # "${src}/modules/randomtube/system.nix" # failing
    "${src}/modules/spotify/home.nix"
    "${src}/modules/vercel-ddns/system.nix"
  ];
  files.mdbook.summary = ''
    ---
    - [Lucas](./ew.md)
  '';
  about.sources = "- [Lucas Eduardo](${url})";
}
