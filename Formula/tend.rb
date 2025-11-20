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
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/tend-0.2.20"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c06c7065b29a3fd74eeca897151eebd0572ca4a606a46c2e9605c2c572b4cc11"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "666da50a470ddbdce85633ff24e9f2963fafbd4da602e55c9bac12bdfab4db19"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"tend", "--version"
  end
end
