class Gud < Formula
  desc "Interactive git helper"
  homepage "https://github.com/lkurcak/gud"
  url "https://github.com/lkurcak/gud/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "f281e08077e1dddd2d7d5f85df2538b5de97a1453480fdac09f1708c1a14e048"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/gud.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/gud-0.1.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e5789ac7c136f779fb3f1d79a396216cf9c73550b0c61fdd909d55d01ef159fb"
    sha256 cellar: :any,                 x86_64_linux: "626b62a6a19a0802ad2970bfa7a3cdc1a75315e75a8e74f91b06d32820db5b54"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"gud", "--help"
  end
end
