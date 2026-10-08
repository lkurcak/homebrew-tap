class Gud < Formula
  desc "Interactive git helper"
  homepage "https://github.com/lkurcak/gud"
  url "https://github.com/lkurcak/gud/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "cf40ccb1a510d5afae8a3fac869d958d8d2fcc3277b17296ccf4c715c2ae379c"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/gud.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/gud-0.1.7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bf5b761d61f4f7be03db644aaec1a3979dc22d6a9c095af88be9463a37f3b88a"
    sha256 cellar: :any,                 x86_64_linux: "424d4ffe67517f3e7dd627f23284ea11c2616d32e7471da04e87c0b1681b4a6b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"gud", "--help"
  end
end
