
{ config, pkgs, ... }:

with pkgs.lib;
let
  cfg = config.test-abc;
in
{
  imports = [
    # paths to other modules
  ];

  options.test-abc = {
    enable = mkEnableOption "A test enable";
  };

  config.home.packages = with pkgs; lib.optionals cfg.enable [ google-chrome-dev ];
  # config.home = mkIf cfg.enable { packages = with pkgs; lib.optionals cfg.enable [ google-chrome-dev ]; };
  # config = mkIf cfg.enable { home.packages = with pkgs; lib.optionals cfg.enable [ google-chrome-dev ]; };
}
