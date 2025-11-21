class Tend < Formula
  desc "Command-line tool for managing and running multiple processes"
  homepage "https://github.com/lkurcak/tend"
  url "https://github.com/lkurcak/tend/archive/refs/tags/0.2.21.tar.gz"
  sha256 "88aab5b0dc24afc7114f173ebf95b7b104ff3f78998b8fb5fc942b6b68a517a6"
  license "Unlicense"
  head "https://github.com/lkurcak/tend.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/tend-0.2.21"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "29e56f37de2614713a6fc57cba27d0141a474caf1db940656b7066c6380c6ea2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c14d4dc17ca6c6c143d19f5e8d93d6fd56b6b3124293cff28995090a9ecf0fdc"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"tend", "--version"
  end
end
