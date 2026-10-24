class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.33.0.tar.gz"
  sha256 "2f660f1b01bf91a46e4694472ed04ed3eb3de0f5fed39f946a3aaf4e97a66aba"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.32.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ca42fb8c5bb96f5f06ac8e1fc67be84fdf95050d32af9070e34a641bcd52a6ed"
    sha256                               x86_64_linux: "faa6c8fb9facccba5ab987fd3e106f424b5e6ccf4fac05e7c101e203eb61b56c"
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
