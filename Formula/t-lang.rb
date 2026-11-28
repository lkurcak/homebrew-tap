class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.111.0.tar.gz"
  sha256 "9fddf941f67f57b8fdca562954613ad9e421da855dc29729b1cb6b9971084444"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.110.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a1cb6fa29276cd4450a8f7703478b9bb35a914bef05989ed27f860985becd601"
    sha256                               x86_64_linux: "085ed46a76dc2c78f50728984716cc599e18ace1804276564f0ed214aafe4fac"
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
