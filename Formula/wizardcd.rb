class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.2")
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.2/wizardcd-1.2.2.tar.gz" # This will be replaced by the GitHub Releases URL
  sha256 "172096177193c9003759cef2356e39208050ed7f0cc6cf29fc3c642c1d83394c" # This will be replaced by the calculated SHA256 checksum
  license "MIT"

  def install
    # The tarball now contains the contents of 'packaging/wizardcd_1.0.0/' at its root.
    # Therefore, the formula paths are relative to that content.

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
