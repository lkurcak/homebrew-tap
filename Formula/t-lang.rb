class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.88.0.tar.gz"
  sha256 "262bd92cef7b78f07cd1e4f2db68b830a2508c913d2c4cc16c2fc0e408f41645"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.87.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d052f74258427ef6720d21fcc3bdb20d647d8da93d8540cdedcff10e45ec463b"
    sha256                               x86_64_linux: "eb90cbb79d40a823032c9003e7064cf5f95fef5b3b136b30efc6a92406b09389"
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
