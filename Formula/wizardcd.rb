class Wizardcd < Formula
  desc "One Config. One Command. Continuous Magic. 🪄"
  homepage "https://wizardcd.com"
  version "1.0.0"  # Will be auto-updated by CI
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.0.0/wizardcd-1.0.0-macos.tar.gz"
  sha256 "replace_this_with_real_checksum"  # Auto-updated by CI
  license "MIT"

  def install
    # Install launcher and full runtime tree
    bin.install "usr/local/bin/wizard"
    prefix.install Dir["usr/share/wizardcd"]
  end

  test do
    # Verify version output from installed binary
    output = shell_output("#{bin}/wizard --version")
    assert_match version.to_s, output
  end
end
