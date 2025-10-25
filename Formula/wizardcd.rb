class Wizardcd < Formula
desc "WizardCD – One Config. One Command. Continuous Magic."
homepage "https://wizardcd.com"
version "1.2.41"
license "MIT"

on_macos do
if Hardware::CPU.arm?
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-arm64.tar.gz"
sha256 "48f47510acf1898003fd0dce7fe59e061dcb22b8d8b10186b00c55c2b77dbd50"
else
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-amd64.tar.gz"
sha256 "48f47510acf1898003fd0dce7fe59e061dcb22b8d8b10186b00c55c2b77dbd50"
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
