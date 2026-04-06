# Install

## From GitHub

This is the most direct install path before the first packaged release:

```bash
uv tool install "git+https://github.com/sankaHQ/sanka-cli.git"
```

## Bootstrap Script

```bash
curl -fsSL https://raw.githubusercontent.com/sankaHQ/sanka-cli/main/scripts/install.sh | sh
```

The script tries PyPI first and falls back to the public GitHub repo if the package is
not published yet.

## From PyPI

After the first packaged release:

```bash
uv tool install sanka-cli
```

## Homebrew

Tagged releases generate `packaging/homebrew/sanka.rb` with the exact release checksum,
and the published tap lives in [`sankaHQ/homebrew-cli`](https://github.com/sankaHQ/homebrew-cli):

```bash
brew tap sankaHQ/cli
brew install sankaHQ/cli/sanka
```

If you installed an older preview from `sankaHQ/tap`
(`sankaHQ/homebrew-tap`), remove the old formula and untap it before
installing from the new tap:

```bash
brew uninstall sanka
brew untap sankaHQ/tap
brew tap sankaHQ/cli
brew install sankaHQ/cli/sanka
```

## Local Development

```bash
uv tool install .
```
