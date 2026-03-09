# Pipewire for audio.
{...}: {
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
}
