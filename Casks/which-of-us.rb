cask "which-of-us" do
  version "1.1.0"
  sha256 "06b641c9d7c65fde5e80c3fdb22a96b3ba9fbdf092d2c3d698be87637069e889"

  url "https://github.com/swchck/which-of-us/releases/download/v#{version}/kto-iz-nas-macos-arm64.dmg"
  name "Кто из нас"
  name "Kto iz nas"
  desc "Party game about guessing who in the room fits the question"
  homepage "https://github.com/swchck/which-of-us"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Only an arm64 image is published; the release has no Intel build to point at.
  depends_on arch: :arm64
  depends_on :macos

  app "Кто из нас.app"

  zap trash: [
    "~/Library/Application Support/app.ktoiznas.desktop",
    "~/Library/Caches/app.ktoiznas.desktop",
    "~/Library/Preferences/app.ktoiznas.desktop.plist",
    "~/Library/Saved Application State/app.ktoiznas.desktop.savedState",
  ]

  caveats <<~EOS
    Кто из нас is not signed with an Apple Developer ID, so macOS will refuse to
    open it the first time. Allow it once in System Settings, under
    Privacy & Security, or remove the quarantine flag by hand:
      xattr -d com.apple.quarantine "/Applications/Кто из нас.app"
  EOS
end
