cask "wishlist-editor" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.3"
  sha256 arm:   "748093a228707abfce9528580fc9256ed3e8567d9014639a966978515a2389b1",
         intel: "df80333ce958bdb76b65f11016ed3f7a36a8a9832088c142dc600e5db8021f48"

  url "https://github.com/swchck/wishlist-editor/releases/download/v#{version}/Wishlist.Editor_#{version}_#{arch}.dmg"
  name "Wishlist Editor"
  desc "Editor for a wishlist published to GitHub Pages"
  homepage "https://github.com/swchck/wishlist-editor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Wishlist Editor.app"

  # Released without an Apple Developer ID, so Gatekeeper refuses the first
  # open and Homebrew has no --no-quarantine flag any more. These are our own
  # builds from our own release workflow, so the check is dropped here rather
  # than left for every install to clear by hand.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Wishlist Editor.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.swchck.wishlist-editor",
    "~/Library/Caches/dev.swchck.wishlist-editor",
    "~/Library/Preferences/dev.swchck.wishlist-editor.plist",
    "~/Library/Saved Application State/dev.swchck.wishlist-editor.savedState",
  ]

  caveats <<~EOS
    Wishlist Editor is not signed with an Apple Developer ID, so this cask clears the
    quarantine flag after installing it. Without that macOS would refuse to
    open the app until you allowed it in System Settings.
  EOS
end
