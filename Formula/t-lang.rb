class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.74.0.tar.gz"
  sha256 "b087d95e9f5e37d6ad56dba51160dbaf3e246bfb1ddd41f14322870e1934972b"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.74.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2fc424e5ec26a0990186b803591f5e154fee55b4ddf5cc26b72394e9b1d898bc"
    sha256                               x86_64_linux: "ffa339860b2cab5315759d27263171bcf6e98800630dc929fea085f2626997af"
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
