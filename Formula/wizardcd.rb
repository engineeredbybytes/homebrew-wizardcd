class Wizardcd < Formula
  desc "WizardCD – One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-arm64.tar.gz"
      sha256 "88f4b618220fbd6e41a404f8f1ea88e5be803c2552c2f860444c8779a17562a4"
    else
      url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-amd64.tar.gz"
      sha256 "88f4b618220fbd6e41a404f8f1ea88e5be803c2552c2f860444c8779a17562a4"
    end
  end

  def install
    bin.install "bin/wizard"
    prefix.install "share/wizardcd"   # installs under Cellar path
  end

  test do
    assert_match "WizardCD version", shell_output("#{bin}/wizard --version")
  end
end
