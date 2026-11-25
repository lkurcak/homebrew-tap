class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.107.1.tar.gz"
  sha256 "5730104ff87ca56d6ec5807627a934f5e7f6fe8b4379f0917c30ea4b6458bb6b"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.107.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4f0d90bdd857b2b80702de46068e732877acefd5089a6ec76ab493ddadd07e64"
    sha256                               x86_64_linux: "6fe43e78d2f63c3db6a769d391824e866a13dd29578c1516221b40e9202d4bb3"
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
