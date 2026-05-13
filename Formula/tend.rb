class Tend < Formula
  desc "Command-line tool for managing and running multiple processes"
  homepage "https://github.com/lkurcak/tend"
  url "https://github.com/lkurcak/tend/archive/refs/tags/1.0.0.tar.gz"
  sha256 "4ebbcb2b73f12fe594dd4fbc132d385323131420e1c1876a05446fa6435a220f"
  license "Unlicense"
  head "https://github.com/lkurcak/tend.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/tend-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b370ae8e2ab38ed4930e0b54cadeac88d0ec67b5fbe304b80fcf465d0bb3b953"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7ed90dbe8b76bfc65187d17b58df781a0b29d09553c5a23220178129b823ee8a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"tend", "--version"
  end
end
