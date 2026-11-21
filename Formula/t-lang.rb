class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.103.0.tar.gz"
  sha256 "79cfd253e4792c4f2642ae46234b592f3eb13fcf9caecb606164ed39bdc003c9"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.103.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5a660f4fa6e80835bd04271f7e08122c4d5ccfa1ed4bd3af02e3e6ae26b0d29a"
    sha256                               x86_64_linux: "274a403624a7bb53761daa605c72dfe91c1b46078d10c54aea0ea71299471539"
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
