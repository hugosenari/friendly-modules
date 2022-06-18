{ pkgs, ...}:
let
  url = "https://github.com/nixosbrasil/climod";
  src =  builtins.fetchGit {
    inherit url;
    rev = "8c15c340dab1074f87cdcf1daa87b65b732c4a19";
    ref = "master";
  };
  pkg = pkgs.writeText "climodmod.nix"
    (builtins.replaceStrings
      ["        options = command;"]
      [''options.name = mkOption { type = str; default = "..."; description = "This is a recursive from command"; };'']
      (builtins.readFile "${src}/modules/common.nix"));
in
{
  files.docs."/gh-pages/src/climod.md".modules = [
    "${pkg}"
    "${src}/modules/extra.nix"
    "${src}/modules/bash/default.nix"
  ];
  files.mdbook.summary = ''
    ---
    - [Climod](./climod.md)
  '';
  about.sources = "- [Climod](${url})";
}
