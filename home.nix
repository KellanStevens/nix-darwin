# home.nix

{ config, pkgs, ... }:

{
    home.stateVersion = "24.11";

    programs.vscode = (import ./apps/vscode.nix { inherit config pkgs; }).config.programs.vscode;

    programs.home-manager.enable = true;

    home.sessionVariables = {
        EDITOR = "nvim";
    };
}
