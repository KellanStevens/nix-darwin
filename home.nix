# home.nix

{ config, pkgs, ... }:

{
    home.stateVersion = "24.11";

    programs.vscode = (import ./apps/vscode/configuration.nix { inherit config pkgs; }).config.programs.vscode;

    programs.home-manager.enable = true;

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    home.file.".zshrc".source = ./.dotfiles/zsh/.zshrc;
    home.file.".zsh/aliases.zsh".source = ./.config/zsh/aliases.zsh;
    home.file.".zsh/keybindings.zsh".source = ./.config/zsh/keybindings.zsh;
}
