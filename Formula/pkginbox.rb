class Pkginbox < Formula
  desc "Inbox for packages installed by hand, outside the dotfiles manifest"
  homepage "https://github.com/swchck/pkginbox"
  url "https://github.com/swchck/pkginbox/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "e00a61defd7f4dbd89017863adb77ae12ddeddf61b64ffe5b3fe9ae10c8a2373"
  license "MIT"
  head "https://github.com/swchck/pkginbox.git", branch: "main"

  bottle do
    root_url "https://github.com/swchck/homebrew-tap/releases/download/pkginbox-0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "98b9bee56ca00c71a5b2f80bd48dcce27d11330c207774c011272861deb14468"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "pkginbox", shell_output("#{bin}/pkginbox --help")
    assert_match version.to_s, shell_output("#{bin}/pkginbox --version")
  end
end
