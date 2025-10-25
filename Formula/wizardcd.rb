class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.5"
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.5/wizardcd-1.2.5.tar.gz"
  sha256 "d09f716c38cf098221374d6dee4071fcf2c38e58f2c51f249bafcad84e68172a"
  license "MIT"

  def install
    # The tarball contains the full Debian-like structure:
    # packaging/wizardcd_1.0.0/usr/local/bin/wizard
    # packaging/wizardcd_1.0.0/usr/share/wizardcd/*
    # Hence, we install using the prefixed structure.

    # Install the main launcher to Homebrew’s bin directory
    bin.install "packaging/wizardcd_1.0.0/usr/local/bin/wizard" => "wizard"

    # Install the shared content directory to Homebrew’s share location
    (share/"wizardcd").install Dir["packaging/wizardcd_1.0.0/usr/share/wizardcd/*"]
  end

  test do
    # Verify that the binary runs and shows version output
    output = shell_output("#{bin}/wizard --version")
    assert_match "WizardCD version", output
  end
end
