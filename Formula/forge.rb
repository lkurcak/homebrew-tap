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
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.9.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "eb66557f227546acb01998538245fee796e62d0bc34853d7a34f28b79120c474"
    sha256 cellar: :any,                 x86_64_linux: "e46d2e7bba8b56d7e0e73eb243e848d81af82ec895aea8b038b07b43096e62f4"
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
