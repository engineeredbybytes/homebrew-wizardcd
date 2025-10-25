class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.16"
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.16/wizardcd-1.2.16.tar.gz"
  sha256 "9e228b14e199c82fd2929b3536f54e2d2a29c426e548880cc7c2cf9d92a2806d"
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
