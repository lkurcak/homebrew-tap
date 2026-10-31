class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.41.0.tar.gz"
  sha256 "9fac3ce36e03af3566359ce2dee23f16172e2692d632919d4f62b949825f267e"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.40.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3e83c2d2ae230e78045ae6f73a52471087958a83a7ae8b721e817df12c4ca832"
    sha256                               x86_64_linux: "adc59af8111ec4d5dbc5d15e72346578570653088fe48cc8b62b9a49b2ca9cfe"
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
