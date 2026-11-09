class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.73.0.tar.gz"
  sha256 "ba51c48db0aff72d2ad3d7db0e11495fa14df7d9b1608fb7323d30ca9f1e9e98"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.73.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "29a86763c9cd7e1bc2ca073e6c8b758bb2e3698578cea91906509cd27b52985a"
    sha256                               x86_64_linux: "043e5de6931bc4cf58777802655ab45e411b7536d9ab8f167bd46ed8a360dc11"
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
