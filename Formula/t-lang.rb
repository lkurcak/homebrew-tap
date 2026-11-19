class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.101.0.tar.gz"
  sha256 "015f1cd54a8fd9fe2c2232d4848bc65bb72e9fbbba0784aab4b5c86c8de75abc"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.101.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4492c81490c6f2257d28f2914b998d2bb4e870f08b15e3c8078345a157ccb476"
    sha256                               x86_64_linux: "4ffbbfbad7f31ba71cb3872472b3368131dd9c04f8f279dda16a2cff096e01b0"
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
