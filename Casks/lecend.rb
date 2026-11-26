cask "lecend" do
  version "0.1.2"

  on_macos do
    on_arm do
      sha256 "18731f0c2b39f54e0ee0cb47f13162281ed927a70f6908af56e92c2ab916ccd5"
      url "https://github.com/orkono/lecend/releases/download/v#{version}/lecend-v#{version}-aarch64-apple-darwin.tar.gz"
      binary "lecend-v#{version}-aarch64-apple-darwin/lecend"
    end
    on_intel do
      sha256 "e194c88f353ba205366ba5289edc3697c78451f6efc0d5e581ff3ce9dba5f55c"
      url "https://github.com/orkono/lecend/releases/download/v#{version}/lecend-v#{version}-x86_64-apple-darwin.tar.gz"
      binary "lecend-v#{version}-x86_64-apple-darwin/lecend"
    end
  end
  on_linux do
    on_arm do
      sha256 "a07c15cbcc568fe3dea382a174ff1eaa8af1984f3baad435df18bfba8dc8bc06"
      url "https://github.com/orkono/lecend/releases/download/v#{version}/lecend-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      binary "lecend-v#{version}-aarch64-unknown-linux-gnu/lecend"
    end
    on_intel do
      sha256 "82784e3e5855de0c06f3176d2debe65047c8b27311b54bfd575d2e12865ca37f"
      url "https://github.com/orkono/lecend/releases/download/v#{version}/lecend-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      binary "lecend-v#{version}-x86_64-unknown-linux-gnu/lecend"
    end
  end

  name "lecend"
  desc "Local glossary of the short labels in a long Claude Code session"
  homepage "https://github.com/orkono/lecend"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}"]
    end
  end

  zap :not_required

  caveats <<~EOS
    Next, in Claude Code:
      claude plugin marketplace add orkono/lecend
      claude plugin install lecend@lecend
  EOS
end
