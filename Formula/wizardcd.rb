class Wizardcd < Formula
desc "WizardCD – One Config. One Command. Continuous Magic."
homepage "https://wizardcd.com"
version "1.2.71"
license "MIT"

on_macos do
if Hardware::CPU.arm?
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-arm64.tar.gz"
sha256 "1276dc6a5ebab71466da9cbac76322ae44d0a0fd9ec8eb17947f88b36369aa84"
else
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-amd64.tar.gz"
sha256 "1276dc6a5ebab71466da9cbac76322ae44d0a0fd9ec8eb17947f88b36369aa84"
end
end

def install
bin.install "bin/wizard"
prefix.install "share/wizardcd"
chmod "+x", Dir["#{prefix}/wizardcd/bin/**/*.sh"]

# Create VERSION file for runtime banner
(File.write("#{prefix}/wizardcd/VERSION", version) rescue nil)
end

def post_install
logdir = HOMEBREW_PREFIX/"var/log/wizardcd"
logdir.mkpath unless logdir.directory?
logdir.chmod 0o777

ohai "--------------------------------------------------"
ohai "WizardCD installed successfully (v" + version + ")"
ohai "Executable: " + (bin/"wizard").to_s
ohai "Logs: " + logdir.to_s
ohai "You can now run: wizard --help"
ohai "--------------------------------------------------"
puts ""
puts "Installation complete! Enjoy continuous magic with WizardCD"
puts ""

# Display ASCII banner directly to stdout (bypasses Homebrew logger)
puts `#{bin}/wizard --banner 2>&1`
rescue => e
opoo "Post-install notice: " + e.message
end

test do
assert_match "WizardCD version", shell_output("\#{bin}/wizard --version")
end
end
