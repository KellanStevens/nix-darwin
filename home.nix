# home.nix

{ config, pkgs, ... }:

{
    programs.home-manager.enable = true;
    home = {
        stateVersion = "24.11";
        sessionVariables = {
            EDITOR = "nvim";
        };

        file = {
            ".zshrc".source = ./.config/zsh/.zshrc;
            ".zsh/aliases.zsh".source = ./.config/zsh/aliases.zsh;
            ".zsh/keybindings.zsh".source = ./.config/zsh/keybindings.zsh;
            ".config/nvim/init.lua".source = ./.config/nvim/init.lua;
            ".config/vscode/style.css".source = ./.config/vscode/style.css;
            ".config/ohmyposh/config.toml".source = ./.config/ohmyposh/config.toml;
            "Library/Application Support/Code/User/settings.json".source = ./.config/vscode/settings.json;
        };
    };
}
