class Pkginbox < Formula
  desc "Inbox for packages installed by hand, outside the dotfiles manifest"
  homepage "https://github.com/swchck/pkginbox"
  url "https://github.com/swchck/pkginbox/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9e1fdedab9d822b9ecee8d83cd770a60bb36d63444a7dd24e00d9fd95b55679b"
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
