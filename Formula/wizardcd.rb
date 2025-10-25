class Wizardcd < Formula
desc "WizardCD – One Config. One Command. Continuous Magic."
homepage "https://wizardcd.com"
version "1.2.40"
license "MIT"

on_macos do
if Hardware::CPU.arm?
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-arm64.tar.gz"
sha256 "dce45abe672835ed9a3072f834572276aa9b624747a8eb820eef94d4ee87ee04"
else
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-amd64.tar.gz"
sha256 "dce45abe672835ed9a3072f834572276aa9b624747a8eb820eef94d4ee87ee04"
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
