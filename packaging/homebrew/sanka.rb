class Sanka < Formula
  include Language::Python::Virtualenv

  desc "Thin command-line wrapper for the Sanka API"
  homepage "https://github.com/haegwan/sanka-cli"
  url "https://github.com/haegwan/sanka-cli/releases/download/v0.1.0/sanka_cli-0.1.0.tar.gz"
  sha256 "6f29bb32bd2b6b33906f139b4b13fd9d4d198a3591fa9beb77190cd62d9c89fa"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "No access token configured", shell_output("#{bin}/sanka auth status 2>&1", 1)
  end
end
