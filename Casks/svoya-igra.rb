cask "svoya-igra" do
  arch arm: "arm64", intel: "x64"

  version "0.5.2"
  sha256 arm:   "9c156af6eb1503f2ab945fad89011ce9c35c33bb6150d7bc1ae3701a13cd16bd",
         intel: "57c983f0029bafac06c75252bf4e2f35c0498ebe781422d3ef012daf5d8f7c55"

  # The filename carries no version, only the tag does.
  url "https://github.com/swchck/svoya-igra/releases/download/v#{version}/Svoya-Igra_macOS-#{arch}.dmg"
  name "Своя Игра"
  name "Svoya Igra"
  desc "Quiz game in the Jeopardy format"
  homepage "https://github.com/swchck/svoya-igra"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Своя Игра.app"

  zap trash: [
    "~/Library/Application Support/io.github.swchck.svoyaigra",
    "~/Library/Caches/io.github.swchck.svoyaigra",
    "~/Library/Preferences/io.github.swchck.svoyaigra.plist",
    "~/Library/Saved Application State/io.github.swchck.svoyaigra.savedState",
  ]

  caveats <<~EOS
    Своя Игра is not signed with an Apple Developer ID, so macOS will refuse to
    open it the first time. Allow it once in System Settings, under
    Privacy & Security, or remove the quarantine flag by hand:
      xattr -d com.apple.quarantine "/Applications/Своя Игра.app"
  EOS
end
