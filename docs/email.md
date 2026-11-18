# Email

Every account under your control can be managed from 2 email accounts.

- Phylactery: Primary email account.
  - Backup password store and GPG keys.
  - Route all aliases, forward all mail.
  - Random password in `pass`.
- Emergency: Grant recovery from catastrophic device loss.
  - Recovery codes for Phylactery.
  - Intentional password. Do not forget.

Use ProtonMail for both, and keep a personal account for friends and family
and maybe a junk address for when an alias isn't allowed. Forward them
to Phylactery.

## Phylactery Usage

Phylactery has 2 primary functions; password backup and alias bucket.

Phylactery is protected with a long and random password. This is not
an inconvenience because [pass manages credentials](./pass.md).

### Cold-Storage Pass Backup

Phylactery keeps a backup of the password store and GPG keys.

Backup your password store and GPG key every once in a while
via email-to-yourself. Delete extra copies.

**GPG Key**
```
gpg --export-secret-keys username@myemail.com > username.sec.gpg
gpg --export username@myemail.com > username.pub.gpg
```

**Password Store**
```
cd $HOME
tar -zcf password-store.tar.gz ./.password-store/
gpg --encrypt password-store.tar.gz
```

Phylactery is a secure enough place to keep these files. ProtonMail have
been good so far, and aliases nearly eliminate real address exposure.

### Aliases

Give every account its own email alias. Route all to Phylactery.
Use aliases everywhere you can. Switching out an alias is faster than
a new email account. SimpleLogin are good for this and pair well with
ProtonMail.

Friends, family and special interests still get a personal address.

- Prevent real email address exposure.
- Filter on naming convention.
  - eg. "travel.delta.southern010@aleeas.com". Throw all emails
    which begin with "travel" in the same folder. Minimize coupon storage.

## Emergency Usage

Create a new email. This one is protected via unique, long, and
memorable password. It is the only protection.

Emergency's main job is to initiate user access on a brand new machine
when all owned machines are unaccessible.

Generate a recovery code for Phylactery and store them in Emergency via
email-to-yourself. This code is the only way to access Phylactery,
and is the only copy.

Use this email on a new machine when no other machines are available
to help bootstrap it.

**Rules**

1. Never use this email address for anything.
2. Never forget this username and password.
3. Only use the account for naked recovery.
4. Never log in to it from hardware you do not own.
