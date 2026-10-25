class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.34.0.tar.gz"
  sha256 "7000901153654d9d3265254f5a737716f261c490743b31721284c5e8b2d01f6b"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.33.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a4564685014a111ffcdbfd87022fdc158c92719e72313baccc4d6c722de6f1bd"
    sha256                               x86_64_linux: "55f274d06627ff9b549cc3375de3a03f2871dbe32013fc962ec4d6f80953a687"
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
