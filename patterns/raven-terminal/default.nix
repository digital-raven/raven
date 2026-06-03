{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./packages.nix

    # Active system-level attachments.
    ./attachments/system.nix
  ];

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # Reduce pipewire latency
  # https://nixos.wiki/wiki/PipeWire#Low-latency_setup
  #services.pipewire.extraConfig.pipewire."92-low-latency" = {
  #  "context.properties" = {
  #    "default.clock.rate" = 48000;
  #    "default.clock.quantum" = 512;  # ~12ms
  #    "default.clock.min-quantum" = 512;
  #    "default.clock.max-quantum" = 512;
  #  };
  #};

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };
}
