class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.17"
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.17/wizardcd-1.2.17.tar.gz"
  sha256 "2b146ef7b16f5cef14bebdd1d58f146a2fdf7cbd32657234d255f8d87963df8b"
  license "MIT"

  def install
    # The tarball now contains usr/local/bin/wizard and usr/share/wizardcd/*
    # Install the launcher
    bin.install "usr/local/bin/wizard" => "wizard"

    # Install the shared WizardCD files
    (share/"wizardcd").install Dir["usr/share/wizardcd/*"]

    # Ensure executable permission on the main launcher
    chmod 0755, bin/"wizard"
  end

  test do
    # Verify CLI version output
    output = shell_output("#{bin}/wizard --version")
    assert_match "WizardCD version", output
  end
end
