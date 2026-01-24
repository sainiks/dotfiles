export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
export PATH=/Users/kixel/.meteor:$PATH

# Added by Antigravity
export PATH="/Users/kixel/.antigravity/antigravity/bin:$PATH"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
