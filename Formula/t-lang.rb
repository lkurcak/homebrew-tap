class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.41.0.tar.gz"
  sha256 "9fac3ce36e03af3566359ce2dee23f16172e2692d632919d4f62b949825f267e"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.41.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d08a5db4ab8e99811dd0c6ea91c3d11352d8326057beb3ad368374aa12755668"
    sha256                               x86_64_linux: "83b58aff7f5072e92e838b576d423698e0cfb784b55adedab6870f5df39c5cfe"
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
