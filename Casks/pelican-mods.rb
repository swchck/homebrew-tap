cask "pelican-mods" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.3"
  sha256 arm:   "3d8320655a49d3d5434b94e35cee0666e0bc42cc25c708796b373ff2bd58cae2",
         intel: "7d3e32294e15b604e667d572fff81ea2a6a085e538420fe38106413e8208cc9c"

  url "https://github.com/swchck/pelican-mods/releases/download/v#{version}/Pelican.Mods_#{version}_#{arch}.dmg"
  name "Pelican Mods"
  desc "Stardew Valley mod manager and launcher"
  homepage "https://github.com/swchck/pelican-mods"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Pelican Mods.app"

  # Released without an Apple Developer ID, so Gatekeeper refuses the first
  # open and Homebrew has no --no-quarantine flag any more. These are our own
  # builds from our own release workflow, so the check is dropped here rather
  # than left for every install to clear by hand.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Pelican Mods.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.swchck.pelican-mods",
    "~/Library/Caches/dev.swchck.pelican-mods",
    "~/Library/Preferences/dev.swchck.pelican-mods.plist",
    "~/Library/Saved Application State/dev.swchck.pelican-mods.savedState",
  ]

  caveats <<~EOS
    Pelican Mods is not signed with an Apple Developer ID, so this cask clears the
    quarantine flag after installing it. Without that macOS would refuse to
    open the app until you allowed it in System Settings.
  EOS
end
