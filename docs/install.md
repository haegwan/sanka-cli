# Install

## From GitHub

This is the most direct install path before the first packaged release:

```bash
uv tool install "git+https://github.com/haegwan/sanka-cli.git"
```

## Bootstrap Script

```bash
curl -fsSL https://raw.githubusercontent.com/haegwan/sanka-cli/main/scripts/install.sh | sh
```

The script tries PyPI first and falls back to the public GitHub repo if the package is
not published yet.

## From PyPI

After the first packaged release:

```bash
uv tool install sanka-cli
```

## Homebrew

Tagged releases generate `packaging/homebrew/sanka.rb` with the exact release checksum.
Publish that formula into your tap repo, then install with:

```bash
brew install haegwan/tap/sanka
```

## Local Development

```bash
uv tool install .
```
