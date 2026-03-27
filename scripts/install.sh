#!/usr/bin/env sh
set -eu

if ! command -v uv >/dev/null 2>&1; then
  echo "Installing uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
  PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
fi

PACKAGE_SPEC="${SANKA_CLI_PACKAGE_SPEC:-sanka-cli}"
FALLBACK_SPEC="${SANKA_CLI_FALLBACK_SPEC:-git+https://github.com/haegwan/sanka-cli.git}"

echo "Installing sanka CLI..."
if uv tool install --upgrade "$PACKAGE_SPEC"; then
  INSTALLED_SPEC="$PACKAGE_SPEC"
else
  echo "Primary package source unavailable, falling back to GitHub..."
  uv tool install --upgrade "$FALLBACK_SPEC"
  INSTALLED_SPEC="$FALLBACK_SPEC"
fi

echo "Installed from $INSTALLED_SPEC"
echo "Run: sanka auth login --access-token '<ACCESS_TOKEN>' --refresh-token '<REFRESH_TOKEN>'"
