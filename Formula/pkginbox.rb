class Pkginbox < Formula
  desc "Inbox for packages installed by hand, outside the dotfiles manifest"
  homepage "https://github.com/swchck/pkginbox"
  url "https://github.com/swchck/pkginbox/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "563cfa21e102cbea8e13619d69a473f8de3541f30a94c068d087b612a3a11db2"
  license "MIT"
  head "https://github.com/swchck/pkginbox.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "pkginbox", shell_output("#{bin}/pkginbox --help")
    assert_match version.to_s, shell_output("#{bin}/pkginbox --version")
  end
end
