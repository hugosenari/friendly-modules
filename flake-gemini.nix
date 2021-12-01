{ config, lib, pkgs, options, ...}:
let
  url = "https://github.com/nix-community/flake-gemini.git";
  src =  builtins.fetchGit {
    inherit url;
    rev = "86e176305027f08e387b860f35dab6ac7fdfb814";
  };
  overlay = final: prev: {
    kineto = pkgs.writeShellScriptBin "kineto" "echo kineto";
    duckling-proxy = pkgs.runCommand "duckling-proxy" {
      meta.homepage = "{duckling-homepage}";
    }  "echo duckling-proxy";
  };

  importModule = path: import "${src}/${path}"
  {
    inherit overlay;
  } 
  {
    inherit lib options;
    config.services.kineto.enable = false;
    config.services.duckling-proxy.enable = false;
    pkgs = pkgs.extend overlay;
  };
in
{
  config.files.docs."/gh-pages/src/flake-gemini.md".modules = [
    (importModule "kineto/nixos-module.nix")
    (importModule "duckling-proxy/nixos-module.nix")
  ];

  config.files.mdbook.summary = ''
    ---
    - [Flake Gemini](./flake-gemini.md)
  '';
  config.about.sources = "- [Flake Gemini](${url})";
}
