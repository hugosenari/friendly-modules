{ lib, config, ...}:
let
  cfg = config.about;
  project = "frind-modules";
  author = "hugosenari";
  org-url = "https://github.com/${author}";
  edit-path = "${org-url}/${project}/edit/master/{path}";
in
{
  imports = [ ./about.nix ];
  files.mdbook.enable = true;
  files.mdbook.authors = ["Cruel Intentions <${org-url}>"];
  files.mdbook.language = "en";
  files.mdbook.gh-author = author;
  files.mdbook.gh-project = project;
  files.mdbook.multilingual = false;
  files.mdbook.title = "Frinds Modules Options";
  files.mdbook.output.html.fold.enable = true;
  files.mdbook.output.html.no-section-label = true;
  files.mdbook.output.html.site-url = "/${project}/";
  files.mdbook.output.html.git-repository-icon = "fa-github";
  files.mdbook.output.html.git-repository-url = "${org-url}/${project}";
  files.mdbook.output.html.edit-url-template = edit-path;
  files.mdbook.summary = lib.mkBefore ''
    # SUMMARY
    - [About](./index.md)
  '';
  files.text."/gh-pages/src/index.md" = ''
    # Friendly Modules

    Random modules documentation collention

    Source code, PR, issue, etc:

    [Friendly Modules](https://github.com/hugosenari/friendly-modules/) at Github

    ### Sources

    ${cfg.sources}
  '';
  files.gitignore.pattern."gh-pages" = true;
  gh-actions.gh-pages.enable = true;
  gh-actions.gh-pages.build = ''publish-as-gh-pages'';
}
