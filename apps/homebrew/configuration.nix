{ pkgs, config, lib, ... }:

{
  homebrew = {
    enable = true;
    taps = import ./taps.nix;
    casks = import ./casks.nix;
    brews = import ./formula.nix;
    masApps = import ./masApps.nix;

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
