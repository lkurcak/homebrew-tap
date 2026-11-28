class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.112.0.tar.gz"
  sha256 "e8833687b3bb452e51b45cad2c4952e5f7e53ca33fa7b9946a2e64d6228400b5"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.111.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1acccfaa192b67f9c6ed94f494dc86f1b1921c3984b3cbc6a8e88f89de155927"
    sha256                               x86_64_linux: "e6af3610ee98fce0c9c9b754919f1f4ceb53f84c5c271376fa8a4e945db9559d"
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
