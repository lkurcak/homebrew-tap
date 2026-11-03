class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.54.0.tar.gz"
  sha256 "65795a55abbd7d63643fbc358b194a9303b4b574bc7ccecedf4d4036b150dfb6"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.54.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8bf8dddff6d8b0683510efd97881d071440127205abd6e5fd2075b9be7a5ed4c"
    sha256                               x86_64_linux: "0e05ded3ea55f9c5c79796b0aadd73401132ccbc7bea563147e029310ae78770"
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
