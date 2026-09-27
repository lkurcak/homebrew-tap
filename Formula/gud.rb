class Gud < Formula
  desc "Interactive git helper"
  homepage "https://github.com/lkurcak/gud"
  url "https://github.com/lkurcak/gud/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "c2068d92208011600575b8c7d2566093070aa3f88ec5c5a4a98254efc1cc3098"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/gud.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/gud-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2e9dc22f96c16923e3e3fbc0e6e4b4fdd69d6737214241bcbe2bc4ed780e419b"
    sha256 cellar: :any,                 x86_64_linux: "3eb15402578612f4707502735d21884dea4d2f266513797770e54629022de929"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"gud", "--help"
  end
end
