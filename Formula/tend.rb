class Tend < Formula
  desc "Command-line tool for managing and running multiple processes"
  homepage "https://github.com/lkurcak/tend"
  url "https://github.com/lkurcak/tend/archive/refs/tags/0.2.18.tar.gz"
  sha256 "a9ced327e3567842effc3b3897972685eb15ac54abdf119b66ff2310fd89dfb3"
  license "Unlicense"
  head "https://github.com/lkurcak/tend.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/tend-0.2.18"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4142cb3ac7c4e2f81bd587ea88eea1a0e2aa071e2ebd364952acda0d31ace548"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4dd9812e58050848b362200a35ec48ce0235690feecdeaa1d848fe62ca35374a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"tend", "--version"
  end
end
