{ lib, ...}:
{
  options.about.sources = lib.mkOption {
    type = lib.types.lines;
    description = "sources lines front page";
    default = "";
  };
}
