export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
export PATH=/Users/kixel/.meteor:$PATH


# Added by Antigravity
export PATH="/Users/kixel/.antigravity/antigravity/bin:$PATH"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"


# --- DOTFILES AUTOMATION ---
save_config() {
    # Store current location
    current_dir=$(pwd)
    
    # Go to vault
    cd ~/dotfiles
    
    # Git magic
    echo "📦 Backing up config..."
    git add .
    git commit -m "Update config: $(date '+%Y-%m-%d %H:%M:%S')"
    git push
    
    # Return to original location
    cd $current_dir
    echo "✅ Configuration synced to GitHub!"
}
