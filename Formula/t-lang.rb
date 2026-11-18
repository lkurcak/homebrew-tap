class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.100.0.tar.gz"
  sha256 "895fc8e84347d914d68af1da16c026fe5cbe9d29d1298faf2b205cfa3c03a4df"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.100.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a1b6b2aa92e3f7b6fe435ab56976fe9a2702f8d8d5b1c9cd3285d58e414903ed"
    sha256                               x86_64_linux: "9eb7a357b6f89f8a4565fe066ac2fc85b22c50a00cd89ceab85c033aff53002f"
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
