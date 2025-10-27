class Wizardcd < Formula
desc "WizardCD – One Config. One Command. Continuous Magic."
homepage "https://wizardcd.com"
version "1.2.83"
license "MIT"

on_macos do
if Hardware::CPU.arm?
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-arm64.tar.gz"
sha256 "cf78322ae7e1b70445955765ecec7b087306c96cbb9871bce0a02748ac261689"
else
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-amd64.tar.gz"
sha256 "cf78322ae7e1b70445955765ecec7b087306c96cbb9871bce0a02748ac261689"
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
