# Check the following URL to see if your GPU is supported by "open".
# If your Nvidia GPU is after the 20-series, it probably is.
#
# https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
{
  pkgs,
  config,
  libs,
  ...
}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  boot.initrd.kernelModules = [ "amdgpu" ];

  # GPU performance profiler `nvtop`.
  environment.systemPackages = with pkgs; [
    nvtopPackages.amd
  ];
}
