{ config, pkgs, ... }: {
config = {
  programs.vscode = {
    enable = true;

    userSettings = import ./settings.nix;
    keybindings = import ./keybindings.nix;
    extensions = (import ./extensions.nix { pkgs = pkgs; })
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace (import ./extensionsFromVscodeMarketplace.nix { pkgs = pkgs; });
  };
};
}
