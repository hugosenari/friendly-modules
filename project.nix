{
  imports = [
    ./book.nix
    ./ew.nix
    ./cocada-boa.nix
    ./impermanence.nix
    ./nixops-datadog.nix
    ./nixops-digitalocean.nix 
    ./nixops-gce.nix 
    ./nixops-hcloud.nix
    ./nixops-libvirtd.nix
    # ./nixos-modules-contrib.nix
    ./nur-combined.nix
    ./flake-gemini.nix
  ];
  # enable .gitignore creation
  files.gitignore.enable = true;
  files.gitignore.template."Global/Archives" = true;
  files.gitignore.template."Global/Backup" = true;
  files.gitignore.template."Global/Diff" = true;
  # now we can use 'convco' command https://convco.github.io
  files.cmds.convco = true;
  # now we can use 'featw' command as alias to convco
  files.alias.feat = ''convco commit --feat $@'';
  files.alias.fix = ''convco commit --fix $@'';
  files.alias.chore = ''convco commit --chore $@'';
}
