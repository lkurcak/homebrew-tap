class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.96.0.tar.gz"
  sha256 "309257ec7a188383599c7ff8526804274be064970956db50bb4d004fd2417a01"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.96.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "66368eac3aed3007aa0322be335906974835187db9e490776c68dc90a7d97c44"
    sha256                               x86_64_linux: "ecc113ae5cc90d4c739067918f7bad699caab20931c3e4b7ff6dabcb74648d97"
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
