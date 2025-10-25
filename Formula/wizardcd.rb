class Wizardcd < Formula
desc "WizardCD – One Config. One Command. Continuous Magic."
homepage "https://wizardcd.com"
version "1.2.44"
license "MIT"

on_macos do
if Hardware::CPU.arm?
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-arm64.tar.gz"
sha256 "d2457507fdc66389159bfe2b7e14c6d9b018abc794b7a9b43787411fc2f4c191"
else
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-amd64.tar.gz"
sha256 "d2457507fdc66389159bfe2b7e14c6d9b018abc794b7a9b43787411fc2f4c191"
end
end

def install
bin.install "bin/wizard"
prefix.install "share/wizardcd"
chmod "+x", Dir["\#{prefix}/wizardcd/bin/**/*.sh"]
end

def post_install
logdir = HOMEBREW_PREFIX/"var/log/wizardcd"
logdir.mkpath unless logdir.directory?
logdir.chmod 0o777

ohai "--------------------------------------------------"
ohai "WizardCD installed successfully (v\#{version})"
ohai "Executable: \#{bin}/wizard"
ohai "Logs: \#{logdir}"
ohai "You can now run: wizard --help"
ohai "--------------------------------------------------"
puts ""
puts "Installation complete! Enjoy continuous magic with WizardCD"
puts ""
rescue => e
opoo "Post-install notice: \#{e.message}"
end

test do
assert_match "WizardCD version", shell_output("\#{bin}/wizard --version")
end
end
