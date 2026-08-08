class Aimeter < Formula
  desc "Real-time AI API usage and cost monitor for macOS"
  homepage "https://github.com/smriti-memcore/aimeter"
  # URL and sha256 updated after each release by the release workflow
  url "https://github.com/smriti-memcore/aimeter/releases/download/v0.1.1/aimeter-v0.1.1.tar.gz"
  sha256 "f894220b87b271cb0e7e4ea8ac3664d87b5adb23cdd1fea9d7b2b56857c46590"
  license "MIT"

  depends_on :macos
  depends_on "python@3"

  def install
    libexec.install "aimeter", "aimeter_daemon.py", "aimeter_cli.py"
    libexec.install "index.html", "index.css", "dashboard.js"
    libexec.install "com.aimeter.app.plist"

    bin.install_symlink libexec/"aimeter"
  end

  service do
    run [opt_libexec/"aimeter"]
    keep_alive crashed: true
    log_path var/"log/aimeter.log"
    error_log_path var/"log/aimeter.log"
  end

  def caveats
    <<~EOS
      AIMeter is installed! To start on login:
        brew services start aimeter

      Then configure your AI tools:
        aimeter setup

      Dashboard: http://127.0.0.1:5333

      To uninstall cleanly:
        aimeter setup --undo
        brew services stop aimeter
        brew uninstall aimeter
    EOS
  end
end
