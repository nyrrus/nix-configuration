{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
    mangohud
    protonup
    gamescope
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "${config.home.homeDirectory}/.steam/root/compatibilitytools.d";
    VK_ICD_FILENAMES = "${pkgs.amdvlk}/etc/vulkan/icd.d/amd_icd64.json";
    RADV_PERFTEST = "aco";
  };

  xdg.configFile."MangoHud/MangoHud.conf".text = ''
    fps=1
    frame_timing=1
    gpu_stats=1
    cpu_stats=1
    vram=1
    ram=1
    frametime=1
  '';

  programs.zsh.shellAliases = {
    protonupdate = "protonup -d ~/.steam/root/compatibilitytools.d/ -t GE-Proton";
  };
}
