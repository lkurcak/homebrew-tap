class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.77.0.tar.gz"
  sha256 "1e2bff76cb3573192137876d48dd4cfca664afddeb3b1ccd4384199abed6ee4c"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.76.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "24417db4bcb0b9cbfcd21e8d1b31cb65fa2b9e667b19afef2701ef8c39a02a8a"
    sha256                               x86_64_linux: "e70d25f07dbdb4d81a9fac58578a47bac194239e91fd547d8ae34e4718d88de5"
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
