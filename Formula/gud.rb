class Gud < Formula
  desc "Interactive git helper"
  homepage "https://github.com/lkurcak/gud"
  url "https://github.com/lkurcak/gud/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "25e8d260babe70eefcc6fa9df7d7ad3038cc6ee27d4ce5af6bcfd1251aebf94c"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/gud.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/gud-0.1.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5b2d5a00134b06706f71e622ce2023d342d6e93150e2ad4a0b5eda485d3ca017"
    sha256 cellar: :any,                 x86_64_linux: "40500f6e5e002e82900fe2dae9cfdc5826f7a2744ea499eef356bf6aa5aa712a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"gud", "--help"
  end
end
