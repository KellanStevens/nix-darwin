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
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace (import ./vscode-extensions.nix pkgs);

    # extraExtensions = [
    #   "dsznajder.es7-react-js-snippets"
    #   "william-voyek.vscode-nginx"

    #   # Git
    #   "donjayamanne.git-extension-pack"
    #   "ziyasal.vscode-open-in-github"

    #   # Misc
    #   "bradzacher.vscode-copy-filename"
    #   "formulahendry.auto-complete-tag"
    #   "wayou.vscode-todo-highlight"
    # ];

    userSettings = {
      "workbench.preferredLightColorTheme" = "Catppuccin Latte";
      "workbench.preferredDarkColorTheme" = "Catppuccin Frappé";
      "diffEditor.ignoreTrimWhitespace" = true;
      "files.trimTrailingWhitespace" = true;
      "editor.guides.indentation" = true;
      "editor.detectIndentation" = true;
      "files.insertFinalNewline" = true;
      "window.newWindowDimensions" = "inherit";
      "workbench.editor.showTabs" = "single";
      "workbench.sideBar.location" = "right";
      "editor.snippetSuggestions" = "top";
      "editor.lineNumbers" = "on";

      # Typography
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.stickyScroll.enabled" = true;
      "editor.cursorBlinking" = "solid";
      "editor.suggestLineHeight" = 30;
      "editor.wordWrapColumn" = 120;
      "editor.suggestFontSize" = 16;
      "editor.fontWeight" = "600";
      "editor.padding.top" = 16;
      "editor.lineHeight" = 24;
      "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
      "terminal.integrated.lineHeight" = 1.5;
      "terminal.integrated.fontSize" = 13;

      # Git
      "githubPullRequests.pullBranch" = "never";

      # PHP
      "php.suggest.basic" = false;

      # Prettier
      "[javascript]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      };
      "[typescriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
          "editor.formatOnSave" = true;
      };
      "[tailwindcss]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
          "editor.formatOnSave" = true;
      };
      "[vue]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
          "editor.formatOnSave" = true;
      };
      "[javascriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
          "editor.formatOnSave" = true;
      };
      "prettier.requireConfig" = true;
      "prettier.useEditorConfig" = false;
      "explorer.sortOrder" = "type";
      "prettier.tabWidth" = 4;
      "workbench.tree.indent" = 15;
      "files.autoSave" = "afterDelay";
      "[css]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
          "editor.formatOnSave" = true;
      };
      "editor.quickSuggestions" = {
          "strings" = true;
      };
      "[jsonc]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[json]" = {
          "editor.defaultFormatter" = "vscode.json-language-features";
      };

      # Search
      "search.useIgnoreFiles" = true;
      "search.exclude" = {
          # Hide everything in /vendor; except the "laravel" and "livewire" folder.
          "**/vendor/{[^l];?[^ai]}*" = true;
          # Hide everything in /public; except "index.php"
          "**/public/{[^i];?[^n]}*" = true;
          "**/node_modules" = true;
          "**/dist" = true;
          "**/_ide_helper.php" = true;
          "**/composer.lock" = true;
          "**/package-lock.json" = true;
          "storage" = true;
          ".phpunit.result.cache" = true;
      };

      # Silence the Noise
      "breadcrumbs.enabled" = false;
      "editor.hover.delay" = 600;
      "editor.hover.enabled" = true;
      "editor.matchBrackets" = "never";
      "workbench.tips.enabled" = false;
      "editor.colorDecorators" = false;
      "git.decorations.enabled" = true;
      "workbench.startupEditor" = "none";
      "editor.lightbulb.enabled" = "onCode";
      "editor.selectionHighlight" = true;
      "editor.overviewRulerBorder" = false;
      "editor.renderLineHighlight" = "none";
      "editor.occurrencesHighlight" = "off";
      "problems.decorations.enabled" = false;
      "editor.renderControlCharacters" = false;
      "editor.hideCursorInOverviewRuler" = true;
      "editor.gotoLocation.multipleReferences" = "goto";
      "editor.gotoLocation.multipleDefinitions" = "goto";
      "editor.gotoLocation.multipleDeclarations" = "goto";
      "workbench.editor.enablePreviewFromQuickOpen" = false;
      "editor.gotoLocation.multipleImplementations" = "goto";
      "editor.gotoLocation.multipleTypeDefinitions" = "goto";
      "git.openRepositoryInParentFolders" = "always";
      "workbench.colorTheme" = "Catppuccin Mocha";

      # APC
      "apc.electron" = {
          "frame" = false;
          "transparent" = true;
          "trafficLightPosition" = {
              "x" = 25;
              "y" = 40;
          };
      };
      "window.commandCenter" = false;
      "workbench.layoutControl.enabled" = false;
      "workbench.iconTheme" = "catppuccin-frappe";
      "workbench.activityBar.location" = "hidden";
      "editor.minimap.enabled" = false;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.verticalScrollbarSize" = 0;
      "window.autoDetectColorScheme" = true;
      "window.restoreWindows" = "preserve";
      "window.restoreFullscreen" = true;
      "update.mode" = "manual";
      "workbench.statusBar.visible"= false;
      "vscode_custom_css.imports" = ["file:///Users/kellan/.vscode/vscode.css"];
    };
  };
};
}
