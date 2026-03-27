from __future__ import annotations

import argparse
from pathlib import Path


def build_formula(version: str, sha256: str, repo: str) -> str:
    release_url = (
        f"https://github.com/{repo}/releases/download/v{version}/"
        f"sanka_cli-{version}.tar.gz"
    )
    test_command = '#{bin}/sanka auth status 2>&1'
    return f"""class Sanka < Formula
  include Language::Python::Virtualenv

  desc "Thin command-line wrapper for the Sanka API"
  homepage "https://github.com/{repo}"
  url "{release_url}"
  sha256 "{sha256}"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "No access token configured", shell_output("{test_command}", 1)
  end
end
"""


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--version", required=True)
    parser.add_argument("--sha256", required=True)
    parser.add_argument("--repo", default="haegwan/sanka-cli")
    parser.add_argument("--output", required=True)
    args = parser.parse_args()

    Path(args.output).write_text(
        build_formula(args.version, args.sha256, args.repo),
        encoding="utf-8",
    )


if __name__ == "__main__":
    main()
