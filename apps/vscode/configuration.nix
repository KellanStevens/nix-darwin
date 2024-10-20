{ config, pkgs, ... }: {
config = {
  programs.vscode = {
    enable = true;

    keybindings = [
      {
        key = "shift+cmd+2";
        command = "editor.action.changeAll";
        when = "editorTextFocus && !editorReadonly";
      }
    ];

    extensions = (import ./extensions.nix { pkgs = pkgs; })
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace (import ./extensionsFromVscodeMarketplace.nix { pkgs = pkgs; });

    userSettings = import ./settings.nix;
  };
};
}
