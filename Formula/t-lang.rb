class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.44.0.tar.gz"
  sha256 "bb82cd070b216f1f8e20b9a37d10a7b0803d6ff476754d1575eb5e5cdf83e916"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.43.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2b2e2fe906f2165ba39a9a8f467804a951b47fdd941440a9e1fc260d7755f0a3"
    sha256                               x86_64_linux: "70b4fd98ff483f4f778761168a9d212c011c6a78bae3fb5cc28d621626193f3a"
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
