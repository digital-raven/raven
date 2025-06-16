# If using raven-hyde, you may wish to use these hydenix drivers.
# If so, comment out or remove your other drivers from host/configuration.nix
# and subtitute with importing this file instead.
{
  inputs,
  ...
}:
{

  imports = [

    # === GPU-specific configurations ===

    /*
      For drivers, we are leveraging nixos-hardware
      Most common drivers are below, but you can see more options here: https://github.com/NixOS/nixos-hardware
    */

    #! EDIT THIS SECTION
    # For NVIDIA setups
    #inputs.hydenix.inputs.nixos-hardware.nixosModules.common-gpu-nvidia

    # For AMD setups
    #inputs.hydenix.inputs.nixos-hardware.nixosModules.common-gpu-amd

    # === CPU-specific configurations ===
    # For AMD CPUs
    #inputs.hydenix.inputs.nixos-hardware.nixosModules.common-cpu-amd

    # For Intel CPUs
    #inputs.hydenix.inputs.nixos-hardware.nixosModules.common-cpu-intel

    # === Other common modules ===
    #inputs.hydenix.inputs.nixos-hardware.nixosModules.common-pc
    #inputs.hydenix.inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];
}
