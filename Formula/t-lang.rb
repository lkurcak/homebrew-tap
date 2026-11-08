class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.70.0.tar.gz"
  sha256 "ddcd23f694a8d30eac2cca7b33861c77fb4194badfa36d114caa1a0c8bc2d2a5"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.69.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7f2dd4cf537225ae8f95462db9fd88fe4cd76458a923bc3d77547d4f892b667f"
    sha256                               x86_64_linux: "a613c4dd71b5e379e312dfa2fec9b5675ab67079b961b2da8eb583f625b8ae21"
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
