class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.38.0.tar.gz"
  sha256 "da3001fcb0939dcee641e95b11d53bbbcbc8f3ff998c5d08e5c2f4d71a932854"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.38.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "87bba28ad0c54dd7781d2a629db1f7843b332d7398557b2b110c3b0ae9039a62"
    sha256                               x86_64_linux: "9b1d6370eaa3f83db8da4ee224acbe951341712b34bb855c64d3061a6007b874"
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
