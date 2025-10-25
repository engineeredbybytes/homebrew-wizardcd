class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.11"
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.11/wizardcd-1.2.11.tar.gz"
  sha256 "cb3551b01ee8b597a2e3731c7725604a203ffbb6518d1db8b72ae6c624e2778e"
  license "MIT"

  def install
    # The tarball extracts directly to usr/local/bin and usr/share/wizardcd
    # We copy these into Homebrew's managed directories.

    # Ensure destination paths exist
    (bin).mkpath
    (share/"wizardcd").mkpath

    # Install the main launcher script (make it executable)
    bin.install "usr/local/bin/wizard"
    chmod 0755, bin/"wizard"

    # Install the shared WizardCD content
    prefix.install Dir["usr/share/wizardcd/*"]

    # Symlink shared files under Homebrew's share path for accessibility
    ln_s prefix/"wizardcd", share/"wizardcd"
  end

  test do
    # Verify that the binary runs and shows version output
    output = shell_output("#{bin}/wizard --version")
    assert_match "WizardCD version", output
  end
end
