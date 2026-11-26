cask "lecend" do
  version "0.1.1"

  on_macos do
    on_arm do
      sha256 "bc6d3434934b47d5e775c39255c7056a0e2f54d575a35d900abdb51e5701c950"
      url "https://github.com/orkono/lecend/releases/download/v#{version}/lecend-v#{version}-aarch64-apple-darwin.tar.gz"
      binary "lecend-v#{version}-aarch64-apple-darwin/lecend"
    end
    on_intel do
      sha256 "3852cc32b124a260365a52f94cc24c3ed158045c47b810f1b17882f5b62e5070"
      url "https://github.com/orkono/lecend/releases/download/v#{version}/lecend-v#{version}-x86_64-apple-darwin.tar.gz"
      binary "lecend-v#{version}-x86_64-apple-darwin/lecend"
    end
  end
  on_linux do
    on_arm do
      sha256 "875b95d8df70c6df72077e2514394c842156f4093769be700bd5db795919273b"
      url "https://github.com/orkono/lecend/releases/download/v#{version}/lecend-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      binary "lecend-v#{version}-aarch64-unknown-linux-gnu/lecend"
    end
    on_intel do
      sha256 "de91f79d115ad9680d803da8c858f3bf594ba7b574c2514ceea402bbcb8f9359"
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
