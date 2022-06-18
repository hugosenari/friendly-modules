let
  url = "https://github.com/nixosbrasil/climod";
  src =  builtins.fetchGit {
    inherit url;
    rev = "8c15c340dab1074f87cdcf1daa87b65b732c4a19";
    ref = "master";
  };
in
{
  files.docs."/gh-pages/src/climod.md".modules = [
    "${src}/modules/default.nix"
  ];
  files.mdbook.summary = ''
    ---
    - [Climod](./climod.md)
  '';
  about.sources = "- [Climod](${url})";
}
