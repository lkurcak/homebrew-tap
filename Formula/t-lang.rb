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
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.53.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "53393a75767f6d677091014b9f2e9ea458c1938e4985ae1f6081538bff4a4cef"
    sha256                               x86_64_linux: "b261531c9815cc9d77146ebe29043a9661833e22cc05e3610da5340b12bff22d"
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
