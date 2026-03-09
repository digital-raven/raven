# Tools for monitoring system vitals and showing software process
# and hardware information.
#
# nvtop is included with Nvidia or AMD GPU drivers.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    btop # CPU, memory, network, disk, and process information.
    iotop # I/O monitor.
    lm_sensors # System temperature information. Command is `sensors`.
    smartmontools # Storage device information, including drive health.
    sysstat # System performance. https://github.com/sysstat/sysstat
  ];
}
