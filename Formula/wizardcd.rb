class Wizardcd < Formula
  desc "WizardCD – One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.36"
  license "MIT"

  # --------------------------------------------------
  # Platform-specific tarballs (auto-detected by Homebrew)
  # --------------------------------------------------
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.36/wizardcd-darwin-arm64.tar.gz"
      sha256 "65fb818e123c4e3b03513c96c30b3130963b28b9e5c7e5d12cfbb28547b74f63"
    else
      url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.36/wizardcd-darwin-amd64.tar.gz"
      sha256 "65fb818e123c4e3b03513c96c30b3130963b28b9e5c7e5d12cfbb28547b74f63"
    end
  end

  # --------------------------------------------------
  # Installation
  # --------------------------------------------------
  def install
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
