class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.13" # Auto-updated by workflow tag
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.13/wizardcd-1.2.13.tar.gz" # Auto-updated by GitHub Actions
  sha256 "2b411b41b8360880ef8515db5490dfcbcef3f197066729b3cf224c5d9380752b" # Auto-updated by workflow
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
