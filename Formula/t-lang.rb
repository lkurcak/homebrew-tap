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
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.108.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ea0ad5029a55713fee94ed140cc07d57d389d16f65c618783f049f5a0648e934"
    sha256                               x86_64_linux: "ae36263fad69a861ff3ddbfccb15b547e10a07f563e29d79618996bd5490f8b6"
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
