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

  # Released without an Apple Developer ID, so Gatekeeper refuses the first
  # open and Homebrew has no --no-quarantine flag any more. These are our own
  # builds from our own release workflow, so the check is dropped here rather
  # than left for every install to clear by hand.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Кто из нас.app"]
  end

  zap trash: [
    "~/Library/Application Support/app.ktoiznas.desktop",
    "~/Library/Caches/app.ktoiznas.desktop",
    "~/Library/Preferences/app.ktoiznas.desktop.plist",
    "~/Library/Saved Application State/app.ktoiznas.desktop.savedState",
  ]

  caveats <<~EOS
    Кто из нас is not signed with an Apple Developer ID, so this cask clears the
    quarantine flag after installing it. Without that macOS would refuse to
    open the app until you allowed it in System Settings.
  EOS
end
