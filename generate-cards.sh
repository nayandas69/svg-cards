#!/bin/bash

set -e

# Configuration
DEPLOYMENT_URL="https://github-profile-card-blue.vercel.app"
USERNAME="nayandas69"

# Format: Day-Month-Year
DATE=$(date +"%d-%m-%Y")
OUTPUT_DIR="assets/$DATE"

# Create dated directory
mkdir -p "$OUTPUT_DIR"

echo "📁 Saving SVGs to: $OUTPUT_DIR"
echo "-----------------------------------"

THEMES=(
"default" "dark" "dracula" "monokai" "nord" "github_dark"
"slate" "midnight" "highcontrast" "pearl" "ice" "sand"
"pastel_peach" "pastel_mint" "pastel_lavender" "pastel_lemon"
"pastel_rose" "mui_blue" "mui_indigo" "mui_teal"
"mui_deep_purple" "mui_orange" "mui_red"
"vscode_dark_plus" "vscode_light" "vscode_monokai_pro"
"vscode_night_owl" "vscode_palenight"
"twitter" "discord" "spotify" "github_light"
"youtube" "instagram" "radical" "cyberpunk"
"synthwave" "oceanic" "mint" "royal"
"gruvbox" "merko" "forest" "rose"
"sunset" "lavender" "ember" "tokyonight"
"onedark" "cobalt"
"amoled_blue" "amoled_green" "amoled_purple"
"grayscale_light" "grayscale_mid" "grayscale_dark"
)

for theme in "${THEMES[@]}"; do
  echo "🎨 Generating card for theme: $theme"
  curl -s "${DEPLOYMENT_URL}/card/${USERNAME}?theme=${theme}" \
    -o "${OUTPUT_DIR}/profile-card-${theme}.svg"
done

echo "-----------------------------------"
echo "✅ All SVGs generated successfully!"
