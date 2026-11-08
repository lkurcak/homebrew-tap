class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.71.0.tar.gz"
  sha256 "d5a27a1bb66d10246c189ee7c16df034508e9fdb3d1d1262b3376053e1792580"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.71.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1156b1a5b94ce04b520feab820f6927d52ba59414cc31b84e1b468ab9b9a767a"
    sha256                               x86_64_linux: "842eb99f4f2b3aac806d127d837bfbfce5ad07334a07e84a69c9d4742a71b887"
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
