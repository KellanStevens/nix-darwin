{
  description = "Kellan's Darwin flake";

  inputs = {
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:LnL7/nix-darwin";
  };

  outputs = inputs@{ self, darwin, nixpkgs, nix-homebrew, home-manager }:
  let
    configuration = { pkgs, config, ... }: {
      # Import Homebrew configuration
      imports = [ ./apps/homebrew/configuration.nix ];

      system.defaults = {
        dock = {
          autohide = true;
          autohide-delay = 0.0;
          mru-spaces = false;
        };

        finder = {
          _FXShowPosixPathInTitle = true;  # show full path in finder title
          AppleShowAllExtensions = true;  # show all file extensions
          FXEnableExtensionChangeWarning = false;  # disable warning when changing file extension
          QuitMenuItem = true;  # enable quit menu item
          ShowPathbar = true;  # show path bar
          ShowStatusBar = true;  # show status bar
        };

        trackpad = {
          Clicking = true;  # enable tap to click
          TrackpadRightClick = true;  # enable two finger right click
          TrackpadThreeFingerDrag = true;  # enable three finger drag
        };

        NSGlobalDomain = {
          "com.apple.swipescrolldirection" = true;  # enable natural scrolling(default to true)
          AppleICUForce24HourTime = true;  # use 24-hour time
          AppleInterfaceStyle = "Dark";  # use dark mode

        };
        loginwindow.GuestEnabled = false;
      };

      users.users.kellan = {
        home = "/Users/kellan";
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      nix.extraOptions = ''warn-dirty = false'';

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake ~/.config/nix#macbook-pro
    darwinConfigurations."macbook-pro" = darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "kellan";
            autoMigrate = true;
          };
        }
        home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kellan = import ./home.nix;
            home-manager.backupFileExtension = "backup";
          }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."macbook-pro".pkgs;
  };
}
