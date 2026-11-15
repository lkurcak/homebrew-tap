class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.94.2.tar.gz"
  sha256 "1e32d4729426af84bfb35831ebc5522669c817f81ae44ab0ede63f2a3275565c"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.94.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f4783fa5819e6398bc77af74a35b5a9453dbecfa8efc89865ad9bc8e7d5d823e"
    sha256                               x86_64_linux: "191d4498c3984190f27a7200402f519fa613ae7b4aa0c189e773c160de5840af"
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
