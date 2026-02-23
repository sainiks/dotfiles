# --- 1. PATHS (Load these first) ---
export PATH="$HOME/.local/bin:$PATH"
export PATH="/Users/kixel/.meteor:$PATH"
export PATH="/Users/kixel/.antigravity/antigravity/bin:$PATH"

# --- 2. LAZY LOAD NVM (Your working robust version) ---
export NVM_DIR="$HOME/.nvm"

load_nvm() {
  # Destroy aliases to prevent conflicts
  unalias nvm node npm 2>/dev/null
  
  # Load the real NVM script
  local nvm_path="/opt/homebrew/opt/nvm/nvm.sh"
  if [ -f "$nvm_path" ]; then
    echo "⚡ Loading Node.js..."
    source "$nvm_path"
    "$@" # Run the command you typed
  else
    echo "Error: NVM not found at $nvm_path"
  fi
}

# Aliases to trigger the load
alias nvm="load_nvm nvm"
alias node="load_nvm node"
alias npm="load_nvm npm"

# --- 3. LAZY LOAD CONDA (The Speed Fix) ---
# This replaces the slow "conda initialize" block.
# Conda will now start 0ms. It only loads when you type 'conda'.
conda() {
    echo "⚡ Loading Conda..."
    unset -f conda  # Delete this placeholder function
    
    # 1. Source the Conda script (Using YOUR specific path)
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi

    # 2. Run the command
    conda "$@"
}

# --- 4. INSTANT TOOLS ---
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# --- 5. AUTOMATION ---
save_config() {
    current_dir=$(pwd)
    cd ~/dotfiles
    echo "📦 Backing up config..."
    git add .
    git commit -m "Update config: $(date '+%Y-%m-%d %H:%M:%S')"
    git push
    cd $current_dir
    echo "✅ Configuration synced to GitHub!"
}
