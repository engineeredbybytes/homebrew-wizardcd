class Wizardcd < Formula
desc "WizardCD – One Config. One Command. Continuous Magic."
homepage "https://wizardcd.com"
version "1.2.39"
license "MIT"

on_macos do
if Hardware::CPU.arm?
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-arm64.tar.gz"
sha256 "f87490204b1b89f96846bbd1a5f7ed76371aef0766cb4b8bb1141cfd33d552cd"
else
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-amd64.tar.gz"
sha256 "f87490204b1b89f96846bbd1a5f7ed76371aef0766cb4b8bb1141cfd33d552cd"
end
end

def install
bin.install "bin/wizard"
prefix.install "share/wizardcd"
end

test do
assert_match "WizardCD version", shell_output("\#{bin}/wizard --version")
end
end
