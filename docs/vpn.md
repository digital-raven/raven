# VPNs and their use

Mullvad has an easy-to-use NixOS command-line program. Their servers
add time to an account number in exchange for money, and they accept
cash by mail.

Some service-providers will pull away from serving VPN users.
Each have their own reasons.

## General Operation

- `mullvad account login <mullvad-acct-number>`
- `mullvad-open`: Open the VPN with killswitch.
- `mullvad relay set location <country-code>`: Tunnel through a country.
- `mullvad-close`: Close VPN and turn off killswitch.
- `mullvad account get`: Print expiration and other account information.
- [This webpage](https://mullvad.net/en/help/how-use-mullvad-cli) has comprehensive information on how to use the `mullvad` command.

## On Public, For Profit VPNs

Their advertisements are full of hype.

Trusting a VPN provider is like hiring a discrete messenger. An ISP only
sees encrypted packets to the VPN provider, but the VPN provider handles and
return the user's real request.

- These services are not security tools; they are obscurity tools. It masks
  messages from middle-men by trusting a commonly-used and silent middle-man.
- A VPN does not secure credentials. https handles this anyway.
- A VPN does not protect from malware. Use your head.
- There is no trivial way to prove a VPN provider holds to their word.

It also costs an extra link in the network chain. Expect worse latency and
throughput when using a VPN, though probably not that noticible.

Reasons to use a VPN.

- Block ISP knowledge of web activity.
- Piracy. [Read the guide](./piracy.md).
- Break region lock.
- Extra protection for anonymous forums. There are some crazies.

This requires you to trust your VPN provider. Any VPN provider worth anything
will have a zero-logging policy verified by third-party audit, include a
killswitch, and will require some sort of on-going fee. Never trust a free VPN.
