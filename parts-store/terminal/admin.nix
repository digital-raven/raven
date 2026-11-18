# System vitals.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    btop # Comprehensive view of top-level system resources.
    iotop # I/O monitor.
    lm_sensors # System temperature information. Command is `sensors`.
    smartmontools # Storage device information, including drive health.
    sysstat # System performance. https://github.com/sysstat/sysstat
  ];
}
