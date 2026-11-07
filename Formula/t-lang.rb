class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.67.0.tar.gz"
  sha256 "98d1ef9c78020f807c967f6613d47542fa0e5c2e73cca80c0d9e50a6ee6bffa6"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.66.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9ffa1d997f2a51d0284229806dcd744f91bd6a21a8cb908e6a60a0a814feb611"
    sha256                               x86_64_linux: "64273bfed0b36bb45cb2db6e5ce42de73a52f982c2d2972550c3cb079dd42f06"
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
