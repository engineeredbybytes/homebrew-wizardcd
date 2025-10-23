class Wizardcd < Formula
  desc "One config. One command. Continuous magic. 🪄"
  homepage "https://wizardcd.com"
  url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v1.0.8/wizardcd-1.0.8-macos.tar.gz"
  sha256 "<REPLACE_WITH_SHA256>"
  license "MIT"
  version "1.0.8"

  def install
    bin.install "wizard"
  end

  test do
    system "#{bin}/wizard", "--version"
  end
end
