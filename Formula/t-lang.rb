class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.68.0.tar.gz"
  sha256 "79dead11e121a75445894147b876d10f2e03a84a3f0c2060744428dbbc2730a3"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.67.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3181049b6a690083f0aa7c11cd156b99758d462d6ebdc60b6b68216d0fdcb7da"
    sha256                               x86_64_linux: "3329def1abc3b31f06e0127d719b15e4f1641e9f2808a29f18190247e2743b59"
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
