{ pkgs, config, lib, ... }:

{
  homebrew = {
    enable = true;
    brews = import ./formula.nix;
    casks = import ./casks.nix;
    masApps = import ./masApps.nix;
    taps = import ./taps.nix;

    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };

  # Activation script to handle symlinks for Homebrew packages.
  system.activationScripts.symlinks = ''
    brew link --overwrite php@8.1
    brew link --overwrite python@3.9
  '';
}
