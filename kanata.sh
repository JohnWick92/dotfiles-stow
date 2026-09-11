#!/usr/bin/env bash
set -euo pipefail

# --- 1. Install Rust via curl ---
if ! command -v rustc >/dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi
source "$HOME/.cargo/env"

# --- 2. Install Kanata via cargo ---
cargo install kanata

# --- 3. Add user to input/uinput groups ---
sudo usermod -aG input "$USER"
sudo usermod -aG uinput "$USER"

# --- 4. Create configuration file ---
CONFIG_DIR="$HOME/.config/kanata"
mkdir -p "$CONFIG_DIR"

cat >"$CONFIG_DIR/kanata.kbd" <<'EOF'
(defsrc
  caps
  esc
)

(deflayer base
  esc
  caps
)
EOF

# --- 5. Insert lines into existing hl.on("hyprland.start") block ---
HYPR_LUA="$HOME/.config/hypr/hyprland.lua"

if [ ! -f "$HYPR_LUA" ]; then
  echo "ERROR: $HYPR_LUA not found."
  exit 1
fi

if ! grep -qF "kanata" "$HYPR_LUA"; then
  sed -i '/hl\.on(["'"'"']hyprland\.start["'"'"']/a\  hl.exec_cmd(os.getenv("HOME") .. "/.cargo/bin/kanata --cfg " .. os.getenv("HOME") .. "/.config/kanata/kanata.kbd")' "$HYPR_LUA"
fi

if ! grep -qF "fcitx5" "$HYPR_LUA"; then
  sed -i '/hl\.on(["'"'"']hyprland\.start["'"'"']/a\  hl.exec_cmd("fcitx5 -d --replace")' "$HYPR_LUA"
fi

echo "Log out and log back in."
