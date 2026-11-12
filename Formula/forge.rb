class Forge < Formula
  desc "Keep a GitHub account's repositories in line with one manifest"
  homepage "https://github.com/lkurcak/forge"
  url "https://github.com/lkurcak/forge/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "a8f9156090248167b35e971939f213a2c7f50be06caef56669029515c92c1e5e"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/forge.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.9.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ad1771afb9941b8f95a71cd22c9fd61e81940c12300f1422b388e81ca8e7ceb0"
    sha256 cellar: :any,                 x86_64_linux: "33cf1ab3eee0392dda6a930955b2576c19e5f5948566480d21fcb1986253fc67"
  end

  depends_on "rust" => :build
  depends_on "gh"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/forge --version")
  end
end
