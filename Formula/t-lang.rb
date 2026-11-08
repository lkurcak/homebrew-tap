class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.71.0.tar.gz"
  sha256 "d5a27a1bb66d10246c189ee7c16df034508e9fdb3d1d1262b3376053e1792580"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.70.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c2869b9955e6e3c04ab3156d5b1d2ddfce7d04f25db15cfb55ee042869337b7b"
    sha256                               x86_64_linux: "3c1b5378fc321a08d021c9540d47ed4cf0c017a707ff2b75a1d4eaf6756c734f"
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
