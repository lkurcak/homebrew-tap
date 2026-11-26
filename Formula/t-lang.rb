class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.108.0.tar.gz"
  sha256 "140ed773ddfb612a5bd4aba941f79597f37459b308bcd00580b31eef8e5c4492"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.107.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "aa0742c9182a52403b76689a90a83b5fa6d5c68aec7a7e18ead08ed1c852ef74"
    sha256                               x86_64_linux: "4f120ab197cfa243c452ee73e6af707dd58661a4769646f607feb86bf1d8ed46"
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
