class Sanka < Formula
  include Language::Python::Virtualenv

  desc "Thin command-line wrapper for the Sanka API"
  homepage "https://github.com/sankaHQ/sanka-cli"
  url "https://github.com/sankaHQ/sanka-cli/releases/download/v0.1.0/sanka_cli-0.1.0.tar.gz"
  sha256 "0b3200eda854edaefb98217ba55361b2ce43b7a6593f934dead289950039783c"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "No access token configured", shell_output("#{bin}/sanka auth status 2>&1", 1)
  end
end
