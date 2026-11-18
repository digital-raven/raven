# Data-Fortress

A user's data-fortress is the description of how they access their
data and where that data is stored.

It encompasses:

1. Local storage.
2. Remote storage.
3. Paths of access to each.
4. The set of all vulnerabilities.

The Raven operating system can serve as a competent entrypoint
into a secure data-fortress.

On its own, Raven provides:

- Local system encryption.
- Offline credential access.
- No information collected.
- Tools for offline drive-management.
- No way of correcting for bad user OPSEC. Use your head.

Remember this URL and Raven can be installed anywhere.

https://codeberg.org/digital-raven/raven

## Providers

Accounts with certain service-providers are recommended to help
provide an expanded feature-set. These features include recovery
from catastrophic device loss.

The tested providers are Mullvad, ProtonMail, SimpleLogin, and
pCloud. Raven has no affiliation with these providers. They have
stood up well against developer audit.

## Fortress Requirements

Data must be available and secure.

1. Fireproof - Survive total loss of all devices.
2. Criminal-proof - Can't be hacked by private entities.
3. Government-proof - Direct government access is non-trivial
   and passive observation is difficult.
4. Minimize manual entry of credentials; Maximize security and convenience.
5. Safeguard metadata.

Raven provides tools and works well with certain service-providers
to meet these requirements.

- [Offline password manager](./pass.md).
- [Email](./email.md) secures credentials and provides recovery.
- [rClone and a cloud storage provider](./encryption.md) secure large data.
- [VPN client provided](./vpn.md).
