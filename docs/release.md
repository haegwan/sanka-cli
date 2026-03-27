# Release

This repository is the public source for the `sanka` CLI. Tagged releases build the
Python distributions, run tests, and generate the Homebrew formula from the release
artifact checksum.

## Release Flow

1. Update `sanka_cli/__init__.py` and `pyproject.toml` to the release version.
2. Create and push a tag such as `v0.1.0`.
3. GitHub Actions builds the sdist and wheel, runs Ruff and pytest, and attaches the
   artifacts to the GitHub release.
4. The release workflow renders `packaging/homebrew/sanka.rb` with the exact checksum
   for the tagged sdist and uploads that formula as a release artifact.
5. Copy the generated formula into `sankaHQ/homebrew-tap`.
6. Publish to PyPI when the repository has a configured `PYPI_API_TOKEN`.

## Homebrew Formula

The formula in this repo is generated, not hand-maintained. Re-render it locally with:

```bash
uv run python scripts/render_homebrew_formula.py \
  --version 0.1.0 \
  --sha256 <sha256-of-sanka_cli-0.1.0.tar.gz> \
  --output packaging/homebrew/sanka.rb
```

The formula points at the GitHub release asset for the matching version.
