# Balance privacy and utility.
#
# We like Mozilla for their web browser and geo-location service
# and that's about all we need them for. The rest is performed
# on the user's own system.
#
# Features we like.
# 1. Save Passwords locally.
# 2. Restore session by default.
# 3. Preserve active logins between browser restarts.
# 4. Set an agnostic, accountless search engine.
# 5. Allow geolocation via mozilla instead of Google.
# 6. User relies on their own password manager to save bookmarks and passwords.
#    Your local browser will grow more convenient the more you use it.
#
# Peace and Quiet and Privacy.
# 1. Turn off sponsored news, links, sites...
# 2. Limit all comms to Mozilla.
# 3. Default to disabling any information.
#
# Some extensions make the internet better.
# 1. UBlock. Internet safety requirement at this point.
# 2. Unhook. Helps make YT a good video library.
# 3. Return YT Dislike. You deserve to lol when corpos get ratioed.
#    It's also necessary to discern quality information from bad.
# 4. ipvfoo. Show IP address of current website in browser tab.
# 5. Wayback Machine. See how pages changed over time.
# 6. Firefox Translations.
#
{
  config,
  pkgs,
  ...
}: {
  # Policies to preserve favored features, disable obvious annoyances,
  # and add privacy / security features when clearly in user's favor.
  #
  # Not a complete enumeration. Missing policies from the link below should be
  # considered un-opinionated.
  #
  # https://mozilla.github.io/policy-templates/
  #
  # `firefox-brainfucksec.nix` has an objectively strict privacy
  # configuration and may be used in place of this module.
  #
  programs.firefox = {
    enable = true;

    policies = {
      AIControls = {Default = {Value = "blocked";};}; # Disable in-browser AI.
      AllowFileSelectionDialogs = true;
      AppAutoUpdate = false;
      AutofillAddressEnabled = false; # Don't give out your address willy-nilly.
      AutofillCreditCardEnabled = false; # No credit-card autofill.
      #BackgroundAppUpdate = false; # Windows only.
      BlockAboutAddons = false; # Not blocking.
      BlockAboutConfig = false; # Not blocking.
      BlockAboutProfiles = false; # Not blocking.
      BlockAboutSupport = false; # Not blocking.
      # Bookmarks # Bookmarks do not belong in home-manager.
      Cookies = {
        Behavior = "reject-tracker"; # Preserve log-in session cookies.
      };
      DisableAppUpdate = true;
      DisableBuiltinPDFViewer = false; # Keep the built in PDF viewer.
      # DisableDefaultBrowserAgent # Windows only.
      DisableFirefoxAccounts = true; # Disable Firefox Account integration.
      DisableFirefoxScreenshots = true; # We have a local screen-shot tool.
      DisableFirefoxStudies = true; # Disable Studies
      DisableFormHistory = false; # Form history is local.
      DisablePasswordReveal = true; # Why ever show your password in plain-text?
      DisablePocket = true; # We have bookmarks.
      DisablePrivateBrowsing = false;
      DisableProfileImport = false;
      DisableProfileRefresh = false;
      DisableRemoteImprovements = true;
      DisableSafeMode = false; # Safe mode is a good tool.
      DisableSetDesktopBackground = true; # Can't set wallpapers like that in hyprland.
      DisableTelemetry = true; # https://mozilla.github.io/policy-templates/#disabletelemetry
      # DisableThirdPartyModuleBlocking # Docs indicate Window only.
      DisplayBookmarksToolbar = "always";
      DisplayMenuBar = "default-off";
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Value = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        SuspectedFingerprinting = true;
        BaselineExceptions = false;
        ConvenienceExceptions = false;
      };
      EncryptedMediaExtensions = {
        Enabled = false; # Active consent required for widevine
      };
      # EnterprisePoliciesEnabled # macOS only.
      ExtensionUpdate = true;
      FirefoxHome = {
        # Remove annoyances.
        Search = false;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
      };
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };
      HardwareAcceleration = true;
      Homepage = {
        StartPage = "previous-session"; # Open previous session on start.
      };
      HttpsOnlyMode = "enabled"; # User *can* turn this off.
      IPProtectionAvailable = false; # Disable browser VPN. Use mullvad.
      # ManagedBookmarks # Not doing.
      ManualAppUpdateOnly = true; # Allow manual updates only and do not notify the user about updates.
      # MicrosoftEntraSSO # macOS only
      NewTabPage = true;
      NoDefaultBookmarks = true; # Raven considers booksmarks as secrets.
      OfferToSaveLogins = true; # Save passwords locally.
      OfferToSaveLoginsDefault = true;
      OverrideFirstRunPage = ""; # Disable first run screen
      PasswordManagerEnabled = true; # Keep built-in password manager
      # Permissions = ??; # Documentation for device permissions make no sense.
      PictureInPicture = {Enabled = true;}; # TODO: Test
      # PopupsBlocking # We don't block popups because they're usually user-prompted.
      Preferences = {
        # For what policies don't handle.
        #
        # https://codeberg.org/jlh/nixos-workstation/src/branch/main/firefox.nix
        #
        # Use Mozilla for geo location instead of Google.
        "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
        # Theming
        "browser.display.use_system_colors" = true; # [Default: false [Non-Windows]]

        # Privacy/Security
        "privacy.annotate_channels.strict_list.enabled" = true;
        "privacy.donottrackheader.enabled" = true;
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.globalprivacycontrol.was_ever_enabled" = true;
        "privacy.partition.network_state.ocsp_cache" = true;
        "privacy.query_stripping.enabled" = true;
        "privacy.query_stripping.enabled.pbmode" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "browser.discovery.enabled" = false; # Disable Firefox extension recommendations
      };
      PrimaryPassword = false; # Annoying.
      PrintingEnabled = true;
      PrivateBrowsingModeAvailability = 0; # Enable private browsing mode.
      PromptForDownloadLocation = true; # Always ask where to save files.
      # Proxy # Do it yourself. Mullvad provides SOCKS v5.
      SanitizeOnShutdown = {
        # Keep most things.
        Cache = false; # Testing showed this was necessary for previous-session.
        Cookies = false;
        FormData = false;
        History = false;
        Sessions = false;
        SiteSettings = false;
      };
      SearchBar = "unified";

      # TODO: Set Qwant as default. Also these don't remove correctly for some reason.
      SearchEngines = {
        Remove = ["Google" "Amazon.com" "Bing" "DuckDuckGo" "eBay" "Perplexity"];
      };
      SearchSuggestEnabled = false; # It's gross.
      ShowHomeButton = true;
      SkipTermsOfUse = true; # You've used firefox before.
      TranslateEnabled = true;
      VisualSearchEnabled = false; # https://connect.mozilla.org/t5/discussions/new-in-firefox-desktop-only-visual-search/m-p/106216

      # Extensions
      #
      # There is a home-manager approach to this, but it requires enabling the
      # Nix User Repository (NUR) in flake.nix as an input.
      #
      # https://nix-community.github.io/home-manager/options/home-manager/programs/firefox.html#opt-programs.firefox.globalExtensions
      #
      # We believe it's safer to pull from the latest mozilla URL, but the
      # home-manager approach is worth mentioning.
      #
      ExtensionSettings = {
        # https://mozilla.github.io/policy-templates/#extensionsettings
        #
        # This information was verified by manually installing the addon,
        # navigating to about:support in firefox, and cross referencing the
        # information in the Add-ons section with the fields called out
        # by the preceding URL.
        #
        # "UUID (id in about:support) = {
        #   "installation_mode" = "normal_installed";
        #   "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/<UUID>/latest.xpi";

        # librewolf gets ublock by default, but we want the latest.
        "uBlock0@raymondhill.net" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
        # Qwant search engine
        "{ac2b7ffb-2186-41bb-a61d-0443875f30ea}" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/{ac2b7ffb-2186-41bb-a61d-0443875f30ea}/latest.xpi";
        };
        # Firefox Translations
        "firefox-translations-addon@mozilla.org" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/firefox-translations/latest.xpi";
        };
        # Return YT Dislike. Only collects video id of the vid you disliked.
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/en-US/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
        };
        # Unhook. Remove YouTube Recommended & Shorts. The URL is weird but this is correct.
        "myallychou@gmail.com" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/en-US/firefox/downloads/latest/myallychou@gmail.com/latest.xpi";
        };
        # Wayback Machine
        "wayback_machine@mozilla.org" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/wayback-machine-new/latest.xpi";
        };
        # Show ipv4/ipv6
        "ipvfoo@pmarks.net" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ipvfoo/latest.xpi";
        };
      };
    };
  };
}
