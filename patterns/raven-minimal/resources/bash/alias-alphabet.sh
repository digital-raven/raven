# Alias Alphabet
## requires: cowsay curl inxi ncal xorg-xeyes
# Address is?
alias a='ip -c a && echo; echo My public IPv4 addresses is: $(curl -m 5 --ipv4 --silent canhazip.com)'
# Block devices
alias b='udisksctl status; echo; echo ---- Block Devices ----; lsblk'
# CPU
alias c='echo -- CPU INFO --; lscpu |grep  "Model name"  && lscpu --extended --online'
# Disk info
alias d='df -hT -x devtmpfs -x tmpfs'
# Epoch
alias e='echo -e Seconds since Unix epoch: $(date +%s) && echo Seconds until 2038 problem: $(( 2147483646 - $(date +%s) ))'
# Forecast weather
alias f='curl -m 5 wttr.in/?2'
# GPU info
alias g='inxi -Gx'
# Hostname
alias h='hostnamectl status'
# Installed packages
#  alias i='echo There are $(dpkg-query -f "${binary:Package}\n" -W |wc -l) packages installed.'
alias i='inxi -Fxxc 25 -y125'
# Journal
alias j='journalctl -b -p crit --no-pager && echo; journalctl --disk-usage'
# Kernel version
alias k='cowsay -f tux Your $(uname -s) kernel is version $(uname -r) on $(uname -p) hardware.'
# List files  <---------  might conflict with existing alias
alias l='ls -1hFs --group-directories-first'
# Memory
alias m='echo -e \\t\\t\\t -- Memory -- && free -mtw'
# Name servers
alias n='echo DNS servers are: && resolvectl dns'
# Open ports
alias o='echo --Listening TCP Ports-- && ss -tlpn && echo -e "\n--Listening UDP Ports--" && ss -ulpn'
# Processes
alias p='echo Processes per user:  && ps -Ao user |sort |uniq -c |sort -n'
# QR code
alias q='curl -m 5 qrenco.de/Linux%20is%20awesome!'
# Routes
alias r='echo -- Network Routes -- && ip -c route'
# Services
alias s='systemctl --no-pager --state=enabled list-unit-files; echo -e \\n Any Failed? ; systemctl --failed'
# Terminal dimensions    <-------- Any other useful Terminal info?
alias t='echo This terminal has $(stty size|cut -d" " -f1) rows and is $(stty size|cut -d" " -f2) characters wide.'
# Uptime
alias u='echo System has been up for $(uptime -p)'
# Value Cryptocoins  (ew!)
alias v='curl -m 5 rate.sx'
# W is for /usr/bin/w
# Xeyes   <---------   Maybe a GUI app is not a good idea.
alias x='timeout 5 xeyes -fg blue'
# Year calendar (actually just 3 months)
alias y='cal -3'
# Zulu time (in aviation)
alias z='echo UTC time is: $(date -u)'
