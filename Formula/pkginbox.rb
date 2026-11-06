class Pkginbox < Formula
  desc "Inbox for packages installed by hand, outside the dotfiles manifest"
  homepage "https://github.com/swchck/pkginbox"
  url "https://github.com/swchck/pkginbox/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cba5b76c2e0fadc9dd71e0a887760fb7c8805f0fa7964f4434bd6f2d167ca2fe"
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
