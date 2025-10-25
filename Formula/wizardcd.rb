class Wizardcd < Formula
  desc "WizardCD - One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.4"
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.2.4/wizardcd-1.2.4.tar.gz"
  sha256 "6fa30105ad132b36dd630e54b2d361774cf7ef6b777a42c3ec9daeec9f36e9fb"
  license "MIT"

  def install
    # The tarball now contains the contents of 'packaging/wizardcd_1.0.0/' at its root.
    # Therefore, the formula paths are relative to that content.

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
