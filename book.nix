{ lib, config, ...}:
let
  cfg = config.about;
  project = "frind-modules";
  author = "hugosenari";
  org-url = "https://github.com/${author}";
  edit-path = "${org-url}/${project}/edit/master/{path}";
in
{
  options.about.sources = lib.mkOption {
    type = lib.types.lines;
    description = "sources lines front page";
    default = "";
  };
  config.files.mdbook.enable = true;
  config.files.mdbook.authors = ["Cruel Intentions <${org-url}>"];
  config.files.mdbook.language = "en";
  config.files.mdbook.gh-author = author;
  config.files.mdbook.gh-project = project;
  config.files.mdbook.multilingual = false;
  config.files.mdbook.title = "Frinds Modules Options";
  config.files.mdbook.output.html.fold.enable = true;
  config.files.mdbook.output.html.no-section-label = true;
  config.files.mdbook.output.html.site-url = "/${project}/";
  config.files.mdbook.output.html.git-repository-icon = "fa-github";
  config.files.mdbook.output.html.git-repository-url = "${org-url}/${project}";
  config.files.mdbook.output.html.edit-url-template = edit-path;
  config.files.mdbook.summary = lib.mkBefore ''
    # SUMMARY
    - [About](./index.md)
  '';
  config.files.text."/gh-pages/src/index.md" = ''
    # Friendly Modules

    Random modules documentation collention

    Source code, PR, issue, etc:

    [Friendly Modules](https://github.com/hugosenari/friendly-modules/) at Github

    ### Sources

    ${cfg.sources}
  '';
  config.files.gitignore.pattern."gh-pages" = true;
  config.gh-actions.gh-pages.enable = true;
  config.gh-actions.gh-pages.build = ''publish-as-gh-pages'';
}
