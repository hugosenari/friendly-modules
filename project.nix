{
  imports = [
    ./book.nix
    ./hugosenari.nix
    ./hlissner.nix
    ./cocada-boa.nix
    ./ew.nix
    ./marcosrdac.nix
    ./flake-gemini.nix
    ./impermanence.nix
    ./kubenix.nix
    ./nixops.nix
    ./nixops-aws.nix
    ./nixops-datadog.nix
    ./nixops-digitalocean.nix 
    ./nixops-gce.nix 
    ./nixops-hcloud.nix
    ./nixops-libvirtd.nix
    ./nixos-hardware.nix
    # ./nixos-modules-contrib.nix
    # ./nur-combined.nix
  ];
  # enable .gitignore creation
  files.gitignore.enable = true;
  files.gitignore.template."Global/Archives" = true;
  files.gitignore.template."Global/Backup"   = true;
  files.gitignore.template."Global/Diff"     = true;
  # now we can use 'convco' command https://convco.github.io
  files.cmds.convco = true;
  # now we can use 'featw' command as alias to convco
  files.alias.feat  = ''convco commit --feat $@'';
  files.alias.fix   = ''convco commit --fix $@'';
  files.alias.chore = ''convco commit --chore $@'';
  files.alias.serve = ''cd $PRJ_ROOT/gh-pages;mdbook serve'';
}
