class Wizardcd < Formula
desc "WizardCD – One Config. One Command. Continuous Magic."
homepage "https://wizardcd.com"
version "1.2.43"
license "MIT"

on_macos do
if Hardware::CPU.arm?
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-arm64.tar.gz"
sha256 "d43bba28cae61a1c11cd24128152316cd6df26c7e7ef98add83a7713c725a0bb"
else
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-amd64.tar.gz"
sha256 "d43bba28cae61a1c11cd24128152316cd6df26c7e7ef98add83a7713c725a0bb"
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
ohai "WizardCD installed successfully (v#{version})"
ohai "Executable: \#{bin}/wizard"
ohai "Logs: \#{logdir}"
ohai "You can now run: wizard --help"
ohai "--------------------------------------------------"
rescue => e
opoo "Post-install notice: #{e.message}"
end

test do
assert_match "WizardCD version", shell_output("\#{bin}/wizard --version")
end
end
