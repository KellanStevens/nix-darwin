# home.nix

{ config, pkgs, ... }:

{
    programs.home-manager.enable = true;
    home = {
        stateVersion = "24.11";
        sessionVariables = {
            EDITOR = "nvim";
        };
    };
}
