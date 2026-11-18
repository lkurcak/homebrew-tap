class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.99.0.tar.gz"
  sha256 "70febdf6901796852ea1ddecc15f1cc0d7a8296defb87feb8ed1ba20a96e26aa"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.98.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a98c2278cbdb41f086446b60f99d2823625825f067ca3238045ebe83d4cae795"
    sha256                               x86_64_linux: "7088d258cf344cc5f12495eef24310491a86b62bc9cd25704a605389bed704c3"
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
