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
}