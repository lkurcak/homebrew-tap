class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.36.0.tar.gz"
  sha256 "c4327b0b46e7a488d31de2b02829111ff1534fdca6bb013eaecb9b23f54a1737"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.36.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d6142f0f96ba83b6709b8f44f6fd2489c4167f850839f749cc21d05f24b3742a"
    sha256                               x86_64_linux: "b8312ed5f991a8d4a379e305550e4c0b4f719ed7326795e19f0f0ad3d84b4106"
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
