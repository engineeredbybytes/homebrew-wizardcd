class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.9"
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.9/wizardcd-1.2.9.tar.gz"
  sha256 "ce32c6fff6053da8c5ba1cccfc1dd566f0f389caf7c67bec9f917c57ce590f61"
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
