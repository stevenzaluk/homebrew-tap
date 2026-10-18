# Rein's Homebrew cask, as published in the stevenzaluk/homebrew-tap repo.
# scripts/release.sh fills in the version and checksum and pushes it there;
# change it here, not in the tap.
cask "rein" do
  version "0.2.0"
  sha256 "0682ff4a2c99b628072d5b6b44001f20511bc2ae48a2113d9b1489a2623eabf4"

  url "https://github.com/stevenzaluk/homebrew-tap/releases/download/rein-v#{version}/Rein-#{version}-arm64.zip"
  name "Rein"
  desc "Nord-themed app for Claude Code, a shell and a file tree"
  homepage "https://github.com/stevenzaluk/homebrew-tap"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Rein.app"
  binary "#{appdir}/Rein.app/Contents/Resources/rein"

  # Rein is signed ad hoc, not with an Apple Developer ID, so macOS would
  # refuse to open it the first time. Installing it from this tap is the
  # consent to run it, so the quarantine flag the download got is cleared.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Rein.app"]
  end

  # com.szaluk.rein was 0.1.0's identifier.
  zap trash: [
    "~/.config/rein",
    "~/Library/Application Support/Rein",
    "~/Library/Preferences/com.stevenzaluk.rein.plist",
    "~/Library/Preferences/com.szaluk.rein.plist",
    "~/Library/Saved Application State/com.stevenzaluk.rein.savedState",
    "~/Library/Saved Application State/com.szaluk.rein.savedState",
  ]
end
