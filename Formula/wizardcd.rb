class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.13"
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.13/wizardcd-1.2.13.tar.gz"
  sha256 "cb736616b26b8da505026bbfd9b5b482ca6306216b76858709ecc5004ad4dbe1"
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
