class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.18" # This will be replaced by the current tag (e.g., "1.0.0")
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.18/wizardcd-1.2.18.tar.gz" # This will be replaced by the GitHub Releases URL
  sha256 "f9d3fac6477b517367a28a4930d0fd43ddf81448adcbb9eaeeec1c94777c4113" # This will be replaced by the calculated SHA256 checksum
  license "MIT"

  def install
    # The tarball contains usr/local/bin/wizard (launcher) and usr/share/wizardcd/* (content)
    
    # 1. Install the launcher to Homebrew's bin directory
    bin.install "usr/local/bin/wizard" => "wizard"

    # 2. Install the shared WizardCD files
    (share/"wizardcd").install Dir["usr/share/wizardcd/*"]
    
    # 3. PATCH FIX: Rewrite the hardcoded DEB path in the launcher script (bin/wizard) 
    # to use the dynamic Homebrew installation path (share/"wizardcd").
    # The launcher needs to delegate to the core script using its final, correct install path.
    inreplace bin/"wizard", "exec /usr/share/wizardcd/bin/wizard.sh \"\$@\"", "exec \#{share}/wizardcd/bin/wizard.sh \"\$@\""
    
    # 4. Ensure executable permission on the main launcher
    chmod 0755, bin/"wizard"
  end

  test do
    # Verify CLI version output
    output = shell_output("#{bin}/wizard --version")
    assert_match "WizardCD version", output
  end
end
