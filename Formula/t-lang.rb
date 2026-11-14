class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.89.0.tar.gz"
  sha256 "dc6869657c802a08ff5b570d517c87a5d23dd182f17f6de85d60d0667698afc0"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.88.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ad26d3e7106de5cdf45196670fd896f3ab3a213ecec2a5ce96601c4946e97495"
    sha256                               x86_64_linux: "8d8a67d37534d05fdd5af557754e841fea4f00764e2888b6cc443e78b3353abb"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    # The test's program is t-lang's own, so its tests keep it working.
    pkgshare.install "examples/brew.t"
  end

  test do
    assert_equal "3628800\n", shell_output("#{bin}/t run #{pkgshare}/brew.t")
  end
end
