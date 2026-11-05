class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.60.0.tar.gz"
  sha256 "c5fea911ace3b78493d884fb3da12946e4e8213ff0091e4e2c60aa6ce6d15779"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.59.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fd2c215c3df79a0adeb836d90c6f3b5ab535b656e358638035475d34c14dbe53"
    sha256                               x86_64_linux: "69aee681c0bb6e75f28685dd9e4d0c7f3c29852a3422530beaa02162cb788028"
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
