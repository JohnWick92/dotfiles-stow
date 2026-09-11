#!/bin/bash

sudo pacman -S yay

yay -Syu --needed --noconfirm neovim clang ghostty-nightly-bin lazygit fcitx5 \
  re2c postgresql-libs stow veracrypt git-delta exa gd wl-clipboard \
  flatpak oniguruma zsh btop zoxide unzip starship mise fcitx5-configtool

if ! grep -q "GTK_IM_MODULE=cedilla" /etc/environment && ! grep -q "QT_IM_MODULE=cedilla" /etc/environment; then
  echo "GTK_IM_MODULE=cedilla
QT_IM_MODULE=cedilla" | sudo tee -a /etc/environment >/dev/null
  echo "✅ Variáveis adicionadas ao /etc/environment"
else
  echo "ℹ️  Variáveis já existem no /etc/environment"
fi

./install.sh
