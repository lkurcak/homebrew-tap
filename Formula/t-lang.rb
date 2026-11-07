class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.63.0.tar.gz"
  sha256 "4122de2a0455eb4e8bfa0d0f19a3204b2786226a92133cd6f51e9ae0591fe488"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.62.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "334cd50ebf359502ec406515a2d2dc2b67d3822e9abeeaeefe1123bad24a1625"
    sha256                               x86_64_linux: "35e0b1b01de53a2cdf80418b1ed58f38beef7e0f385c489cd3165aef1b51149d"
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
