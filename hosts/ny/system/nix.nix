{ ... }:
{
  nix = {
    settings = {
      cores = 0; # 0 = all cores
      max-jobs = "auto";
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  
  nixpkgs.config.allowUnfree = true;
}
