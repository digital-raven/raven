# Private Operation of Raven

Raven features a first-class path to private and anonymous usage.

- Raven requires no internet connection after installation.
- Raven does not collect personal information of any kind.
- Raven has no way of correcting for user-side OPSEC leaks.
- Raven itself requires no account, but accounts with certain
  service-provides are recommended, even for an anonymous user.

A user should keep in mind that Raven includes some commercial programs
that should not be used by a user seeking anonymity. Steam is one example
because they don't accept cash, and Discord may refuse service to VPN
users.

Always use your head. Giving personal information or contacting any
service-provider without a VPN will break anonymity.

## Tiers of Privacy

Whenever you create an account or speak on the internet then your voice
and actions will fall under one of the 3 privacy rings below. "Opponent"
refers to any actor attempting to access your information.

1. Public: Anyone in the general public knows it's you.
2. Private: The public can't see but the government can. Criminals are
   your opponents.
3. Anonymous: Your opponent is the government. Private operation is
   attainable and far less fragile than Anonymous operation.

An example of a public account is a Facebook account created under a
your legal name. Anything you say there is obviously you; VPN be damned.

Your bank account is private. The government can view it but your peers
and criminals cannot excepting for cyber attacks.

An account exclusively accessed under a VPN connection is anonymous so
long as it contains no personal information, but you're always free to dox
yourself. Every word can be used to hunt you.

Raven can satisfy "Anonymous" use-cases, but doing so correctly is the
responsibility of its user.

## Principles, Tools, and Service Providers

Core privacy principles.

1. There's no reason to trust anyone for anything we can do ourselves.
2. For tasks where DIY is fundamentally counter-productive, then use a
   thoroughly-vetted 3rd party.
3. If it must be necessary to use a known-compromised 3rd party, provide
   only non-personal information accessed via VPN.

There are some service providers that we'll need for backup and restoration
purposes. This is necessary because an Anonymous user has both criminals
and the government as opponents, and should operate such that any device is
disposable. A foreign customs offical may confiscate your laptop, for example
and you may have to acquire a new one from inside the country.

Every service-provider will roll over to government demand if they ask
for help in locating you or accessing your data. The service providers
discussed in this document shouldn't have any mechanism to meaningfully
assist with this.

We also need DIY credential management and data-encryption which satisfies
these requirements.

1. Fireproof - Survive total loss of all devices.
2. Criminal-proof - Can't be hacked by private entities.
3. Government-proof - Direct government access is non-trivial and passive
   observation is impossible.
4. Minimal manual entry of credentials by the user. Necessary for both
   security and convenience.

Raven provides tools and recommends certain service-providers to meet
these principles and requirements.

These service-providers are Mullvad, ProtonMail, and SimpleLogin. Raven
has no affiliation with these providers.

> ### IMPORTANT
>
> You will need to remember these 3 passwords
>
> 1. Passwords to encrypted Raven installations. These are typed at boot.
> 2. Your GPG key password. This is used in conjunction with `pass`.
> 3. Emergency email account. The "Email" section goes into detail on this.

### VPN

If you desire anonymous web-browsing access then the first thing you must
set up is a new Mullvad account. Navigate to [mullvad.net](https://mullvad.net) and
generate an account number. Don't access the internet again until the account
is active. Mullvad accepts cash via mail.

You can start using it with these 2 commands.
- `mullvad account login <your-mullvad-acct-number>`
- `mullvad-open`: Open the mullvad connection and lock network traffic to
    VPN only. This must be re-run after every power-cycle to allow for
    internet access.
- `mullvad relay set location <country-code>`: Tunnel internet traffic through
    a particular country.

> ### IMPORTANT
> 
> Running `mullvad-close` closes the VPN connection and re-enables
> unprotected internet access. This will break anonymity.
> 
> Never allow your account's funding to lapse. You would have to mail
> cash before accessing the internet again.
>
> A VPN is an obscurity tool, not a security tool. It muddies the source
> of your voice, but your words themselves are clear to any who hear.

It should be noted that service-providers tend to pull away from serving VPN
users. Each have their own reasons, and you must consider for each service
provider whether this trade-off is worth it.

### Password Management

Use the `pass` command-line program. This program will store your passwords
in individually encrypted files under the `~/.password-store` directory.
The filenames themselves are not encrypted.

Pass allows you to easily manage unique email addresses and passwords for
each account you use, and is trivial to back-up.

A GPG key is required.

- `gpg --generate-key`. Don't use your real name or email-address.
- Edit it to "Ultimate" trust. `gpg --edit-key your-gpg-email@whatever.com`

> ### IMPORTANT
>
> NEVER FORGET the password for your GPG key. You must remember it.
> NO COMPUTER can remember this for you.
>
> `pass` will prompt for this password upon the first access per login.
> This password is necessary for a user to access all other passwords.

Run these commands to configure pass.

- `pass init your-gpg-email@whatever.com`
- `pass git init`

If you need to configure a local git account then run these and
try again.

- `git config --global user.name "A Name"`
- `git config --global user.email "anywords@whatever.com"`

#### Tips for pass

- Organize your passwords by `service-type/website/username`.
- Encrypt all personal storage devices with long and random passwords.
  Use 60 characters whenever possible.
- If you care about anonymity then don't ever let your web-browser remember
  any logins. Your best convenience is `pass -c`.
- You can write anything using `pass edit`. Doesn't have to be just passwords.

### Email

[ProtonMail](https://proton.me) are good private email providers. [They accept cash](https://proton.me/support/payment-options#cash).

Create 2 ProtonMail accounts
- Emergency: Used to recover Core in event of total device loss.
- Core: Primary email. Aliases will be directed to it. Pay for this one.

> ### IMPORTANT
>
> NEVER FORGET the password for your Emergency email account.
> 
> Generate a random password for your Core email and store it in `pass`.
>
> Generate recovery codes for your Core email account and send them to your
> Emergency email from itself. The Emergency email must contain no references
> to your Core email account.
>
> Never log into your Emergency email except under VPN or on a virgin device
> in case of total device loss. It is your secret backdoor. Never use it for
> anything other than recoving your Core email account.

Email a backup of your `pass` folder to yourself within your Core email
account. Do the same with your GPG keys. You can create these files with
the following commands.

```
cd $HOME && tar -zcf password-store.tar.gz .password-store
gpg --export-secret-keys your-gpg-email@whatever.com > priv.key
gpg --export your-gpg-email@whatever.com > pub.key
```

Email these files to yourself on your Core ProtonMail account. Update the
password-store backup every so often. Download them, and then install them
using commands similar to the following code example.

```
cd $HOME && tar -zxf password-store.tar.gz
gpg --import priv.key
gpg --import pub.key

# New machines require trust-setting. Set to "Ultimate".
gpg --edit-key your-gpg-email@whatever.com
```

> ### IMPORTANT
> 
> Download these files for each new Raven installation. `pass git` is useful
> for syncronizing credentials across devices, but even a private git
> repository will break anonymity if you've ever accessed that account
> from a non-VPN connection.

### Email Aliases

Create a [SimpleLogin](https://simplelogin.com) account using your
ProtonMail account. A premium account allows for unlimited aliases, but
breaks anonymity because they don't accept cash.

Generate a new alias for every account you create. Follow a convention like
`service-type.website` as the base. Similar to something like
"shopping.amazon.futurama145@aleeas.com", for example.

Aliases have several advantages.

- Easy generation of unique usernames for each account.
- Filtering emails is easy. Every email where the recipient begins with
  "shopping" can go into a "Shopping" folder. ProtonMail's features folders
  and filters which facilitate this nicely, and are a premium feature.
- Any spam resulting from a data breach will contain the compromised company
  in the recipient address.
- Changing an alias is easy. Create a new alias, update the account's email,
  rename the file in `pass` and delete the old alias.

### Encrypted Installations and Storage

Use the LUKS disko profile when prompted by `raven-configure`. This will
encrypt your installation. You'll set a password for the drive upon
completed operation of the `disko` command shown during the end of
`raven-configure`.

> ### IMPORTANT
> 
> This password must be entered manually by the user for each boot.
> `pass` cannot remember it for you.

Use `cryptsetup` to mange other personal drives. Veracrypt is also installed
on `raven-desktop`. Feel free to store those passwords in `pass`, and
generate long and random passwords for each.

### Encrypted Cloud Storage

The `rclone` program can manage encrypted remotes. [pCloud](https://pcloud.com) sells lifetime
cloud storage plans for personal use, and works well with Rclone's device-side
encryption.

The files and their names will appear as encrypted blobs to pCloud, but your
Rclone remote can mount and sync them in plaintext on your machine's local
storage.

> ### IMPORTANT
> 
> Back up your Rclone's configuration to pass.
> 
> ```
> # Copy-paste ~/.config/rclone/rclone.conf
> pass edit rclone.conf
> 
> # Install rclone.conf on new installations
> pass rclone.conf > ~/.config/rclone/rclone.conf
> ```
