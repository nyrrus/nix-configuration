{ vars, ... }:
{
  imports = [
    (./. + "/${vars.de}/${vars.de}.nix")
  ];
}
