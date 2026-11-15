class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.94.0.tar.gz"
  sha256 "7f8f2206c839f98ccf291f324fdcfa681ffe56334681bc2ebb1df3f40c1f0701"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.94.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5981c7ceeacdde34b4b5a3645562543b6accbf39e49d8e3296b7968efeada774"
    sha256                               x86_64_linux: "e8e300595337ab76f1b558c16b9e8c512abf3c5e24891b008ec23635afdab44d"
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
