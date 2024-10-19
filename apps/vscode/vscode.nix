{ config, pkgs, ... }: {
  config = {
    programs.vscode = {
      enable = true;

      extensions = with pkgs.vscode-extensions; [
        # Looks
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        # equinusocio.moxer-icons
        # drcika.apc-extension
        # be5invis.vscode-custom-css

        # Languages
        hashicorp.hcl
        vue.volar
        bbenoist.nix
        bmewburn.vscode-intelephense-client
        bradlc.vscode-tailwindcss
        # mblode.twig-language-2
        # msjsdiag.vscode-react-native
        # pranaygp.vscode-css-peek
        # dsznajder.es7-react-js-snippets
        # william-voyek.vscode-nginx

        # Copilot
        github.copilot
        github.copilot-chat

        # Microsoft
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-containers
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        # ms-vscode.remote-explorer

        # Git
        waderyan.gitblame
        github.vscode-pull-request-github
        mhutchie.git-graph
        eamodio.gitlens
        aaron-bond.better-comments
        alefragnani.project-manager
        donjayamanne.githistory
        codezombiech.gitignore
        # donjayamanne.git-extension-pack
        # ziyasal.vscode-open-in-github

        # Misc
        tomoki1207.pdf
        formulahendry.auto-close-tag
        formulahendry.auto-rename-tag
        formulahendry.code-runner
        vincaslt.highlight-matching-tag
        editorconfig.editorconfig
        esbenp.prettier-vscode
        davidanson.vscode-markdownlint
        dbaeumer.vscode-eslint
        xdebug.php-debug
        # bradzacher.vscode-copy-filename
        # formulahendry.auto-complete-tag
        # wayou.vscode-todo-highlight
      ];
    };
  };
}
