class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.76.0.tar.gz"
  sha256 "35e91028c3e9fc88e09482f2a630ebd12f20ecb884cb2f07cbba7d5555694d0b"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.75.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0b0f9662fcd5f4bc972ba2f444eb5ad1c8c556d448f619970ca557c24e4e9e8a"
    sha256                               x86_64_linux: "cfb484f26c53c04afd5bafb34963a0695b38e08087ed3169f1a4a80be7cc1bf8"
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
