{ pkgs, ... }:

{
  vscode.extensions = [
    "aaron-bond.better-comments"
    "alefragnani.project-manager"
    "bbenoist.nix"
    "be5invis.vscode-custom-css"
    "bmewburn.vscode-intelephense-client"
    "bradlc.vscode-tailwindcss"
    "bradzacher.vscode-copy-filename"
    "catppuccin.catppuccin-vsc"
    "catppuccin.catppuccin-vsc-icons"
    "codezombiech.gitignore"
    "davidanson.vscode-markdownlint"
    "dbaeumer.vscode-eslint"
    "donjayamanne.git-extension-pack"
    "donjayamanne.githistory"
    "drcika.apc-extension"
    "dsznajder.es7-react-js-snippets"
    "eamodio.gitlens"
    "editorconfig.editorconfig"
    "equinusocio.moxer-icons"
    "esbenp.prettier-vscode"
    "formulahendry.auto-close-tag"
    "formulahendry.auto-complete-tag"
    "formulahendry.auto-rename-tag"
    "formulahendry.code-runner"
    "github.copilot"
    "github.copilot-chat"
    "github.github-vscode-theme"
    "github.vscode-pull-request-github"
    "hashicorp.hcl"
    "mblode.twig-language-2"
    "mhutchie.git-graph"
    "ms-azuretools.vscode-docker"
    "ms-vscode-remote.remote-containers"
    "ms-vscode-remote.remote-ssh"
    "ms-vscode-remote.remote-ssh-edit"
    "ms-vscode.remote-explorer"
    "msjsdiag.vscode-react-native"
    "pranaygp.vscode-css-peek"
    "tomoki1207.pdf"
    "vincaslt.highlight-matching-tag"
    "vue.volar"
    "waderyan.gitblame"
    "wayou.vscode-todo-highlight"
    "william-voyek.vscode-nginx"
    "xdebug.php-debug"
    "ziyasal.vscode-open-in-github"
  ];

  # VSCode user settings
  vscode.settings = {
    "editor.tabSize" = 4;
    "editor.formatOnSave" = true;
    "workbench.colorTheme" = "Material Theme";
    "files.autoSave" = "afterDelay";
    "python.pythonPath" = "/usr/local/bin/python3";
  };
}
