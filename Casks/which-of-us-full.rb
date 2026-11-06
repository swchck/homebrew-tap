# frozen_string_literal: true

cask "which-of-us-full" do
  version "1.2.0"
  sha256 "e62c59bf896ec2d6f2ce344e9b2c1ffe296e437ee08bb2e4d473c09f97661387"

  url "https://github.com/swchck/which-of-us/releases/download/v#{version}/kto-iz-nas-macos-arm64-full.dmg"
  name "Кто из нас"
  name "Kto iz nas"
  desc "Party game about guessing who in the room fits the question, with voices"
  homepage "https://github.com/swchck/which-of-us"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "swchck/tap/which-of-us"
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
    This build carries the voices, which is why the download is over a gigabyte.
    Install which-of-us instead to get a small download that fetches them on
    first run.

    Кто из нас is not signed with an Apple Developer ID, so this cask clears the
    quarantine flag after installing it. Without that macOS would refuse to
    open the app until you allowed it in System Settings.
  EOS
end
