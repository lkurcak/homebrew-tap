class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.90.0.tar.gz"
  sha256 "ca95f4715f80d2b17868324604263eb9d5a6f2d0a5eecabd34be66273ff10d30"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.89.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a4579e28a0570f97d4210b6d1272313ae23d0e8d812934964a94451892ddeb56"
    sha256                               x86_64_linux: "c8e4878f193498b9b455033dd7d27e15e28583fa80f8e392982dbcf584f6cfc1"
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
