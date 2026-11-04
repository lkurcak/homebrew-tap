class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.56.0.tar.gz"
  sha256 "64c1e293f60d8fbc1c2929b66981c014d4dabf0e72ee4991367390df606460fb"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.55.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "886d04ca958e72016096057ec69598472570b2d511b54ca627c21239c4c9ba1c"
    sha256                               x86_64_linux: "51ed6c128232815f4638847b99e8a27e0b8d20aba6bc96ede2cd5b6d25e81b17"
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
