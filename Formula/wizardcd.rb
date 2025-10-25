class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.14"
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.14/wizardcd-1.2.14.tar.gz"
  sha256 "c96d7312c9ef2b6c524933e7d63a755883a61422dd6755927ed4701bff13c6d8"
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
