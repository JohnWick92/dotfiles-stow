#!/bin/bash

sudo sed -i 's/ParallelDownloads = [^12]/ParallelDownloads = 12/' /etc/pacman.conf
sudo sed -i 's/#Color/Color/' /etc/pacman.conf
if ! grep -q ILoveCandy /etc/pacman.conf; then
  sudo sed -i '/Color/a\ILoveCandy' /etc/pacman.conf
fi
yay -Syu --needed --noconfirm neovim wezterm clang \
  re2c postgresql-libs stow veracrypt git-delta exa \
  flatpak oniguruma zsh btop zoxide unzip

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install app/org.mozilla.thunderbird/x86_64/stable -y
flatpak install app/org.mozilla.firefox/x86_64/stable -y

curl https://mise.run | sh
curl -sS https://starship.rs/install.sh | sh -s -- -y

if ! grep -q "GTK_IM_MODULE=cedilla" /etc/environment && ! grep -q "QT_IM_MODULE=cedilla" /etc/environment; then
  echo "GTK_IM_MODULE=cedilla
QT_IM_MODULE=cedilla" | sudo tee -a /etc/environment >/dev/null
  echo "✅ Variáveis adicionadas ao /etc/environment"
else
  echo "ℹ️  Variáveis já existem no /etc/environment"
fi
