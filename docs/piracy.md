
# Piracy

Piracy is useful sometimes.

1. Pay whenever possible. Sometimes torrenting someone else's file is easier
   than ripping your own. Only pirate media you've already paid for or otherwise own.
2. Some video games have DRM which makes their legal versions unusable. Piracy
   is the only way to play them in this case.
3. Some media isn't for sale anymore, and creating a new copy from fellow
   pirates doesn't cost the original publisher anything.
4. A PC is a great alternative to a original hardware, malfunctioning
   or otherwise.
5. Region-lock. Can't buy what isn't being sold.

Regardless, expect to get a letter if you don't use a VPN and proxy.

## Popular piracy sites

The Pirate Bay continues its operation to this day and remains the most consistent
site to search for content.

## Tools

Use `mullvad` and `qbittorrent`.

[Here's the VPN instructions](./vpn.md). Keep it on.

Configure `qbittorrent` preferences.

- Connection:
  - Set Proxy Server. SOCKS5 Host 10.64.0.1 Port 1080.
  - Check "Perform hostname lookup via Proxy".
  - Check "Authentication".
  - Enter mullvad account number for "Password".
  - Check all "Use proxy for..." boxes.
- BitTorrent:
  - Check "Enable DHT", "Peer Exchange (PeX)", and "Local Peer Discovery".
  - Uncheck "Enable anonymous mode". [It doesn't seem that important](https://github.com/qbittorrent/qBittorrent/wiki/Anonymous-Mode).
- Advanced:
  - Network interface: wg0-mullvad
