class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.102.0.tar.gz"
  sha256 "8c8ab1ecdd65be7168449b2508ba2024da9b20204bff2ef6bc5bda69bb9eca7f"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.101.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b7bc7ca525ce6d124ebd57e6599151b6d55516ec91bebb84779af42f6ef84260"
    sha256                               x86_64_linux: "4c7efe4601be52ede15cfb993c4488dba0e91599819081e6132e82d441db9ec3"
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
