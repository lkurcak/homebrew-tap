class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.106.0.tar.gz"
  sha256 "651f8c33f51ea515b2da6d84bebae185b29be8d87587f51a303c777c6c333ded"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.106.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "346178b94c4459492f59ca50e97781db0bdb433095c767b925f761cd276e0201"
    sha256                               x86_64_linux: "e5b6ddf5d8968a70eb32a202e09a35f73342f95b5d8da89e31c6eedf253d7d73"
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
