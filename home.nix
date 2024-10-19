# home.nix

{ config, pkgs, ... }:

let
    vscodeConfig = import ./apps/vscode/vscode.nix { inherit config pkgs; };
in
{
    home.stateVersion = "24.11"; # Please read the comment before changing.

    home.packages = [
        # (pkgs.nerdfonts.override { fonts = [ "Hack" "JetBrainsMono" ]; })
    ];

    home.file = {
        # # Building this configuration will create a copy of 'dotfiles/screenrc' in
        # # the Nix store. Activating the configuration will then make '~/.screenrc' a
        # # symlink to the Nix store copy.
        # ".screenrc".source = dotfiles/screenrc;

        # # You can also set the file content immediately.
        # ".gradle/gradle.properties".text = ''
        #   org.gradle.console=verbose
        #   org.gradle.daemon.idletimeout=3600000
        # '';
    };

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.vscode = vscodeConfig.config.programs.vscode;

    programs.home-manager.enable = true;
}
