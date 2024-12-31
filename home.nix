# home.nix

{ config, pkgs, ... }:

{
    home.stateVersion = "24.11";

    programs.home-manager.enable = true;

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    home.file.".zshrc".source = ./.config/zsh/.zshrc;
    home.file.".zsh/aliases.zsh".source = ./.config/zsh/aliases.zsh;
    home.file.".zsh/keybindings.zsh".source = ./.config/zsh/keybindings.zsh;

    home.file.".config/nvim/init.lua".source = ./.config/nvim/init.lua;

    home.file.".config/ohmyposh/config.toml".source = ./.config/ohmyposh/config.toml;

    home.file.".config/vscode/settings.json".source = ./.config/vscode/settings.json;
}
