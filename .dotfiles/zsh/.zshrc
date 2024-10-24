[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/keybindings.zsh ]] && source ~/.zsh/keybindings.zsh

SPACESHIP_PROMPT_ASYNC=FALSEexport PATH="/usr/local/sbin:$PATH"

export PATH="/Users/kellan/stack/.bin:$PATH"
export PATH="/Users/kellan/Library/Android/sdk:/Users/kellan/Library/Android/sdk/emulator:/Users/kellan/Library/Android/sdk/platform-tools:$PATH"
export PATH="$PATH:~/.composer/vendor/bin"
export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.1/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

if [ "$TERM_PROGRAM" = "WarpTerminal" ] || [ "$TERM_PROGRAM" = "iTerm.app" ] || [ "$TERM_PROGRAM" = "Apple_Terminal" ]
then
  fastfetch
fi
