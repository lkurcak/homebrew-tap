class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.85.0.tar.gz"
  sha256 "7a3a6f8f13c794c69ee0b2716813bfce98d6859637373a62c8b6f69a05bb730c"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.84.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a84aaa20ae15a28ed64131e0c859c47c570b135ed6255d38469d2342677233c4"
    sha256                               x86_64_linux: "94120a10887c51399c676edbfcc03b0a204179c2a24114508b08f99cfaefbe08"
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
