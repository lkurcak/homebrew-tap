class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.37.0.tar.gz"
  sha256 "ffdd87665ad4cdb4544360f996305ed331dccb1544349f6f32a956193efacb42"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.37.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a6e5a458ccbd6a3110be2f0e8b17c01f4cac09f8413b4d74fdc90fdd5d8ea6b2"
    sha256                               x86_64_linux: "53fa73f6883d5885072a92a88f9a6315c3b70f6d0b308a22039328632ed11827"
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
