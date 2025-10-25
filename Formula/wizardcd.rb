class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.8"
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.8/wizardcd-1.2.8.tar.gz"
  sha256 "1917b43a9309d7a76888f0bb7c1a9e792576191fca689e8d15befe3e992a609a"
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
