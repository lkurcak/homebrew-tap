class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.107.2.tar.gz"
  sha256 "016e81a43a609080a08bde46af76c1795a37bee92dcaf561d6290ecefa7e876e"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.107.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "26a7927948753bfa614fab2e467c01b56e1eb366d2220a0dbe16cd219fa84fb8"
    sha256                               x86_64_linux: "a63919149602fffcc34503146e3e24f1d8a9fe8474d563dbd1a9b5aa586b8a6a"
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
