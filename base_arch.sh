#!/bin/bash

yay -Syu --needed --noconfirm neovim clang ghostty-nightly-bin \
  re2c postgresql-libs stow veracrypt git-delta exa \
  flatpak oniguruma zsh btop zoxide unzip starship mise

if ! grep -q "GTK_IM_MODULE=cedilla" /etc/environment && ! grep -q "QT_IM_MODULE=cedilla" /etc/environment; then
  echo "GTK_IM_MODULE=cedilla
QT_IM_MODULE=cedilla" | sudo tee -a /etc/environment >/dev/null
  echo "✅ Variáveis adicionadas ao /etc/environment"
else
  echo "ℹ️  Variáveis já existem no /etc/environment"
fi
