class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.49.0.tar.gz"
  sha256 "1dfbfd0fc7812d1f71e7cb0cc2819148939458b9bb8fb13dd377647921d2edd7"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.49.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e45056e8a671478794da206bf801e201141460855798c18eb873ecf78c5e2b49"
    sha256                               x86_64_linux: "540546a21082cb041f6807b958a0cef90b485c15e72d165af48885f15818181b"
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
