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
    casks = import ./casks.nix;
    formula = import ./formula.nix;
    masApps = import ./masApps.nix;

    configuration = { pkgs, config, ... }: let
    vsCode = import ./vscode.nix { inherit pkgs; };
    in {
      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        mkalias
        keka
        warp-terminal
        obsidian
        rectangle
        vsCode.vscode
      ];

      homebrew = {
        enable = true;
        brews = formula;
        casks = casks;
        masApps = masApps;

        taps = [
          "artginzburg/tap"
        ];

        onActivation.cleanup = "zap"; # ONLY ENABLE THIS ONCE I'VE LISTED ALL THE CASKS I WANT
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

      fonts.packages = with pkgs; [
        (pkgs.nerdfonts.override { fonts = [ "Hack" "JetBrainsMono" ]; })
      ];

      # Activation script to handle symlinks for Homebrew packages.
      system.activationScripts.symlinks = ''
        brew link --overwrite php@8.1
        brew link --overwrite python@3.9
      '';

      # Activation script fix spotlight indexing.
      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
          '';

      system.defaults = {
        dock.autohide = true;
        dock.autohide-delay = 0.0;
        dock.mru-spaces = false;
        loginwindow.GuestEnabled = false;
        NSGlobalDomain.AppleICUForce24HourTime = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        trackpad.TrackpadThreeFingerDrag = true;
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
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."mac".pkgs;
  };
}
