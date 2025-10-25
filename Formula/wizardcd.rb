class Wizardcd < Formula
desc "WizardCD – One Config. One Command. Continuous Magic."
homepage "https://wizardcd.com"
version "1.2.42"
license "MIT"

on_macos do
if Hardware::CPU.arm?
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-arm64.tar.gz"
sha256 "6c8b92e01f4b3619076febe4af65bf7ae818aa6adb7a547547f2d65b4c6da06a"
else
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-amd64.tar.gz"
sha256 "6c8b92e01f4b3619076febe4af65bf7ae818aa6adb7a547547f2d65b4c6da06a"
end
end

def install
bin.install "bin/wizard"
prefix.install "share/wizardcd"
chmod "+x", Dir["\#{prefix}/wizardcd/bin/**/*.sh"]
end

def post_install
logdir = Pathname.new("/var/log/wizardcd")
logdir.mkpath unless logdir.directory?
logdir.chmod 0o777
ohai "--------------------------------------------------"
ohai "WizardCD installed successfully (v#{version})"
ohai "Executable: \#{bin}/wizard"
ohai "You can now run: wizard --help"
ohai "--------------------------------------------------"
end

test do
assert_match "WizardCD version", shell_output("\#{bin}/wizard --version")
end
end
