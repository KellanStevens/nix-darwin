# home.nix

{ config, pkgs, ... }:

let
    vscodeConfig = import ./apps/vscode.nix { inherit config pkgs; };
in
{
    home.stateVersion = "24.11";

    programs.vscode = vscodeConfig.config.programs.vscode;

    programs.home-manager.enable = true;

    home.sessionVariables = {
        EDITOR = "nvim";
    };
}
