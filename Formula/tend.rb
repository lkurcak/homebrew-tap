class Tend < Formula
  desc "Command-line tool for managing and running multiple processes"
  homepage "https://github.com/lkurcak/tend"
  url "https://github.com/lkurcak/tend/archive/refs/tags/0.2.20.tar.gz"
  sha256 "2e9ba0b8236cad3c49eef2c43e199ca994029b8f08c702382aa83861176d44aa"
  license "Unlicense"
  head "https://github.com/lkurcak/tend.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/tend-0.2.19"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "00fbb39c7465fee6f8aa76c8f7470fc759e19fa46250a8000d762ec0e99111a0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7ac70fc1e01330c6a4217b9791f0184d95520bac8d50ea7e0391effa2057d6a7"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"tend", "--version"
  end
end
