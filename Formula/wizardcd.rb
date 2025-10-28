class Wizardcd < Formula
  desc "WizardCD – One Config. One Command. Continuous Magic."
  homepage "https://wizardcd.com"
  version "1.2.87"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-arm64.tar.gz"
      sha256 "df2a3e9c113fabe0c8128b5d88420e89e69be69c796c3b18a536c0c115904f0c"
    else
      url "https://github.com/engineeredbybytes/wizardcd-releases/releases/download/v#{version}/wizardcd-darwin-amd64.tar.gz"
      sha256 "df2a3e9c113fabe0c8128b5d88420e89e69be69c796c3b18a536c0c115904f0c"
    end
  end

  def install
    # --------------------------------------------------
    # Install WizardCD executable
    # --------------------------------------------------
    bin.install "bin/wizard"

    # --------------------------------------------------
    # Relocate internal core scripts to libexec path
    # --------------------------------------------------
    libexec.install Dir["wizardcd/bin/core/*"]

    # --------------------------------------------------
    # Install shared assets
    # --------------------------------------------------
    prefix.install "share/wizardcd"

    # --------------------------------------------------
    # Ensure all internal scripts are executable
    # --------------------------------------------------
    chmod "+x", Dir["#{libexec}/*.sh"]

    # --------------------------------------------------
    # Create VERSION file for runtime banner
    # --------------------------------------------------
    (libexec/"VERSION").write(version)
  end

  def post_install
    logdir = HOMEBREW_PREFIX/"var/log/wizardcd"
    logdir.mkpath unless logdir.directory?
    logdir.chmod 0o777

    # --------------------------------------------------
    # Restrict internal access (best practice)
    # --------------------------------------------------
    if (libexec/"deploy.sh").exist?
      system "chmod", "-R", "500", libexec.to_s
      system "chown", "-R", "root:admin", libexec.to_s rescue nil
      ohai "[WizardCD] Core secured at #{libexec}"
    end

    # --------------------------------------------------
    # Display success banner
    # --------------------------------------------------
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
    assert_match "WizardCD version", shell_output("#{bin}/wizard --version")
  end
end
