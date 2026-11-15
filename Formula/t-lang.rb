class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.95.0.tar.gz"
  sha256 "59dba3a06098a39c2272dc4488f2ab69bf0bd2dd59a259343f62a086a6e5863c"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.94.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "63e5295b433bd7113b2d48a61d2f2d4473a7b7392d7c1c205f0b2022770720bf"
    sha256                               x86_64_linux: "ddd0ce52f60a9379f64f9db09e1d0564194b99314a055847341d166556f76693"
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
