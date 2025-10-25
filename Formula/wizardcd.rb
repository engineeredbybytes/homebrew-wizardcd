class Wizardcd < Formula
  desc "WizardCD – One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.0"
  license "MIT"

  # --------------------------------------------------
  # Platform-specific tarballs (auto-detected by Homebrew)
  # --------------------------------------------------
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.0/wizardcd-darwin-arm64.tar.gz"
      sha256 "REPLACE_ARM64_SHA"
    else
      url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.0/wizardcd-darwin-amd64.tar.gz"
      sha256 "REPLACE_AMD64_SHA"
    end
  end

  on_linux do
    url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.0/wizardcd-linux-x86_64.tar.gz"
    sha256 "REPLACE_LINUX_SHA"
  end

  # --------------------------------------------------
  # Installation
  # --------------------------------------------------
  def install
    # Homebrew automatically extracts the tarball.
    # The binary should be in the root of the archive.
    bin.install "wizard"
  end

  # --------------------------------------------------
  # Basic verification test
  # --------------------------------------------------
  test do
    output = shell_output("#{bin}/wizard --version")
    assert_match "WizardCD version", output
  end
end
