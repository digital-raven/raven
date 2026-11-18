# Cryptocurrencies

Raven does not come with any cryptocurrency programs installed by default.

Avoid crypto currencies in general. The domain is rife with scams, but
some crypto currencies are honest, and Bitcoin is one of them.
[Here is an excellent video](https://www.youtube.com/watch?v=bBC-nXj3Ng4) detailing how Bitcon works.

## Electrum

`electrum` is a software Bitcoin wallet. It creates a wallet using a
series of words that it calls a "seed". This wallet is recoverable
anywhere using only this seed. [Save your seed to pass](./pass.md).

Installing it requires an insecure package.

```
# main-system/configuration.nix
nixpkgs.config.permittedInsecurePackages = [                                                               
  "python3.12-ecdsa-0.19.1" # electrum requirement.                                                        
];    

# main-system/system-packages.nix
environment.systemPackages = with pkgs; [
  electrum
];
```

[Here is Electrums' FAQ page](https://electrum.readthedocs.io/en/latest/faq.html) with more
details on how Electrum works. Read it before you start putting money into this wallet.
