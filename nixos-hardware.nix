{ lib, ...}:
let
  url = "https://github.com/NixOS/nixos-hardware.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "4c9f07277bd4bc29a051ff2a0ca58c6403e3881a";
  };
in
{
  files.text."/gh-pages/src/nixos-hardware.md" = ''
    Modules that could be found at [NixOS Hardware](https://github.com/NixOS/nixos-hardware)
  '';
  files.docs."/gh-pages/src/nixos-hardware-asus.md".modules = [
    "${src}/asus/battery.nix"
  ];
  files.docs."/gh-pages/src/nixos-hardware-surface.md".modules = [
    "${src}/microsoft/surface/firmware/surface-go/ath10k/default.nix"
  ];
  files.docs."/gh-pages/src/nixos-hardware-raspberry.md".modules = [
    "${src}/raspberry-pi/4/audio.nix"
    "${src}/raspberry-pi/4/dwc2.nix"
    "${src}/raspberry-pi/4/modesetting.nix"
    "${src}/raspberry-pi/4/poe-hat.nix"
    "${src}/raspberry-pi/4/tc358743.nix"
  ];
  files.docs."/gh-pages/src/nixos-hardware-system76.md".modules = [
    "${src}/system76/darp6/default.nix"
  ];
  files.mdbook.summary =  let
    hardwares = map (v: "- [${v}](./nixos-hardware-${v}.md)") [
      "asus"
      "surface"
      "raspberry"
      "system76"
    ];
  in lib.mkAfter ''
    ---
    - [NixOS Hardware](./nixos-hardware.md)
      ${builtins.concatStringsSep "\n  " hardwares}
  '';
  about.sources = "- [NixOS Hardware](${url})";
}
