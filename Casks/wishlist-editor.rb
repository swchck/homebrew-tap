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

  zap trash: [
    "~/Library/Application Support/dev.swchck.wishlist-editor",
    "~/Library/Caches/dev.swchck.wishlist-editor",
    "~/Library/Preferences/dev.swchck.wishlist-editor.plist",
    "~/Library/Saved Application State/dev.swchck.wishlist-editor.savedState",
  ]

  caveats <<~EOS
    Wishlist Editor is not signed with an Apple Developer ID, so macOS will refuse to
    open it the first time. Allow it once in System Settings, under
    Privacy & Security, or remove the quarantine flag by hand:
      xattr -d com.apple.quarantine "/Applications/Wishlist Editor.app"
  EOS
end
