#!/bin/bash
# install.sh - Minimalist dotfiles installer

echo "🚀 Setting up environment..."

# Install Oh My Zsh if not present
[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install plugins
CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
[ ! -d "$CUSTOM/plugins/fast-syntax-highlighting" ] && git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$CUSTOM/plugins/fast-syntax-highlighting"
[ ! -d "$CUSTOM/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions.git "$CUSTOM/plugins/zsh-autosuggestions"

# Apply ALL packages with Stow (using .dotfiles directory)
cd ~/.dotfiles || exit
stow --restow */ # The asterisk targets every folder as a package

echo "✅ Done! Run: exec zsh"
