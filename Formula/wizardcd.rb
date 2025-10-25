# In https://github.com/engineeredbybytes/homebrew-wizardcd/blob/main/Formula/wizardcd.rb
class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "${VERSION}" # This will be replaced by the current tag (e.g., "1.0.0")
  url "${TARBALL_URL}" # This will be replaced by the GitHub Releases URL
  sha256 "${SHA256}" # This will be replaced by the calculated SHA256 checksum
  license "MIT"

  def install
    # NOTE: The paths are adjusted to reflect the structure within your repository's debian-like packaging folder, 
    # assuming the tarball contains the 'wizardcd_1.0.0' directory.
    # We copy the executable from: packaging/wizardcd_1.0.0/usr/local/bin/wizard
    bin.install "packaging/wizardcd_1.0.0/usr/local/bin/wizard" => "wizard"

    # We copy the shared files from: packaging/wizardcd_1.0.0/usr/share/wizardcd/*
    (share/"wizardcd").install Dir["packaging/wizardcd_1.0.0/usr/share/wizardcd/*"]
  end

  test do
    # Verify that the binary runs and shows version output (which is in your wizard script)
    output = shell_output("#{bin}/wizard --version")
    assert_match "WizardCD version", output
  end
end
