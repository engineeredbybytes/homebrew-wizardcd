class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.5" # Auto-updated by workflow tag
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.5/wizardcd-1.2.5.tar.gz" # Auto-updated by GitHub Actions
  sha256 "b5d0742ab2ded3f09046b6a92e65d3ea534b45b1697c94fba38bd07cb030a857" # Auto-updated by workflow
  license "MIT"

  def install
    # The tarball now extracts directly to usr/local/bin and usr/share/wizardcd
    # No 'packaging/' prefix anymore.

    # Install the main launcher to Homebrew's bin directory
    bin.install "usr/local/bin/wizard" => "wizard"

    # Install the shared content directory to Homebrew's share location
    (share/"wizardcd").install Dir["usr/share/wizardcd/*"]
  end

  test do
    # Verify that the binary runs and shows version output
    output = shell_output("#{bin}/wizard --version")
    assert_match "WizardCD version", output
  end
end
