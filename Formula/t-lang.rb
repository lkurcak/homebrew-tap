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
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.95.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1895b15f71aaac5aa74dd97b780d7c66ed0e7a27fc0c50726216d0a4910669d8"
    sha256                               x86_64_linux: "a7bac297963e959a06020ec9be4d52c4609169b8e63735cef2009a52c80c3853"
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
