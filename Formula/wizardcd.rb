class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.15"
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.15/wizardcd-1.2.15.tar.gz"
  sha256 "74873f28986a1c2deda79f0eee298ca59fd42feb6e4e8e3a0a8ee230c10c244b"
  license "MIT"

  def install
    # We're inside the extracted tarball root which contains usr/local/bin/wizard
    # and usr/share/wizardcd — so reference them directly (no nested prefix).

    bin.install "usr/local/bin/wizard"
    chmod 0755, bin/"wizard"

    (share/"wizardcd").install Dir["usr/share/wizardcd/*"]
  end

  test do
    # Verify that the binary runs and shows version output
    output = shell_output("#{bin}/wizard --version")
    assert_match "WizardCD version", output
  end
end
