class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.93.0.tar.gz"
  sha256 "e3d2926c8e5fd2f29d580df7af19d33126fccc8e07823c179d6dfb61be118c9f"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.93.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4d2666ab91de3a2fb5a95b5a96b607aa6a5084483b19464b8aaf9743afbccd9e"
    sha256                               x86_64_linux: "4ff4374c5ed5dec1461d6059348318a20fab1b118c1ece22a39b3d90cdea817b"
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
