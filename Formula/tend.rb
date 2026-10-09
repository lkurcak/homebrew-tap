class Tend < Formula
  desc "Command-line tool for managing and running multiple processes"
  homepage "https://github.com/lkurcak/tend"
  url "https://github.com/lkurcak/tend/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "69fade73afc26322376147620843c4f2bc993ee702ebbcba1d549714e5aa354e"
  license "Unlicense"
  head "https://github.com/lkurcak/tend.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/tend-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6ecf3b8e7aaee98751e7cb4842c38aea635b1f8667ba99800dcbf01a23f6ceda"
    sha256 cellar: :any,                 x86_64_linux: "622a836aeaaf710c26e53f03577ded33633729380e612a1b3f51f246bd777227"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"tend", "--version"
  end
end
