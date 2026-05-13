class Ghelpr < Formula
  desc "CLI tool for working with GitHub pull requests"
  homepage "https://github.com/lkurcak/ghelpr"
  url "https://github.com/lkurcak/ghelpr/archive/refs/tags/0.2.1.tar.gz"
  sha256 "be7a017b0462dd0fc024c5fe32a84f2ea5ca966f96d83d730eccdbd59522faed"
  license "MIT"
  head "https://github.com/lkurcak/ghelpr.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/ghelpr-0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "013f0bc3ee62d3973f5bf5b97994873e7df62f3524aa6354bd732ba4a1a1213e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "74c4bc8f3d0d7b5713f8ab644b6386457d4972f2d3adf04ebaa0e70ae74e3aa0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ghelpr", "--help"
  end
end
