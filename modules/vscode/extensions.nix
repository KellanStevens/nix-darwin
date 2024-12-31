{ pkgs, ... }: with pkgs.vscode-extensions; [
  # Looks
  catppuccin.catppuccin-vsc
  catppuccin.catppuccin-vsc-icons

  # Languages
  hashicorp.hcl
  vue.volar
  bbenoist.nix
  bmewburn.vscode-intelephense-client
  bradlc.vscode-tailwindcss

  # Copilot
  github.copilot
  github.copilot-chat

  # Microsoft
  ms-azuretools.vscode-docker
  ms-vscode-remote.remote-containers
  ms-vscode-remote.remote-ssh
  ms-vscode-remote.remote-ssh-edit

  # Git
  waderyan.gitblame
  github.vscode-pull-request-github
  mhutchie.git-graph
  eamodio.gitlens
  aaron-bond.better-comments
  alefragnani.project-manager
  donjayamanne.githistory
  codezombiech.gitignore

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
]
