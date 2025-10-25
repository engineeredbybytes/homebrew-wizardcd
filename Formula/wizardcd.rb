class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.4" # This will be replaced automatically by workflow tag
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.4/wizardcd-1.2.4.tar.gz" # Auto-updated by GitHub Actions
  sha256 "b5d0742ab2ded3f09046b6a92e65d3ea534b45b1697c94fba38bd07cb030a857" # Auto-updated by workflow
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
