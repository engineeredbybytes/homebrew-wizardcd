class Wizardcd < Formula
desc "WizardCD – One Config. One Command. Continuous Magic."
homepage "https://wizardcd.com"
version "1.3.4"
license "MIT"

on_macos do
if Hardware::CPU.arm?
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-arm64.tar.gz"
sha256 "e4a479dec06d3fc85ad06412ab5807aae714bb6d8134daeafdad3d19330fa72b"
else
url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-amd64.tar.gz"
sha256 "a40e7ef2bfabf64f96c71925c383b926ed1766b3c17ca918707e2c38ea1c73ec"
end
end

def install
bin.install "bin/wizard"
prefix.install "share/wizardcd"

# Secure post-install permissions (Phase 2.3)
if Dir.exist?("\#{prefix}/wizardcd/bin")
  chmod "u=rx,go=", Dir["\#{prefix}/wizardcd/bin/**/*.sh"]
  chmod "u=rx,go=", Dir["\#{prefix}/wizardcd/**/*.sh"]
end

# Create VERSION file for runtime banner
(File.write("\#{prefix}/wizardcd/VERSION", version) rescue nil)
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
