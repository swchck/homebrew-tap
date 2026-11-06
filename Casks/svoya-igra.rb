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

  # Released without an Apple Developer ID, so Gatekeeper refuses the first
  # open and Homebrew has no --no-quarantine flag any more. These are our own
  # builds from our own release workflow, so the check is dropped here rather
  # than left for every install to clear by hand.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Своя Игра.app"]
  end

  zap trash: [
    "~/Library/Application Support/io.github.swchck.svoyaigra",
    "~/Library/Caches/io.github.swchck.svoyaigra",
    "~/Library/Preferences/io.github.swchck.svoyaigra.plist",
    "~/Library/Saved Application State/io.github.swchck.svoyaigra.savedState",
  ]

  caveats <<~EOS
    Своя Игра is not signed with an Apple Developer ID, so this cask clears the
    quarantine flag after installing it. Without that macOS would refuse to
    open the app until you allowed it in System Settings.
  EOS
end
