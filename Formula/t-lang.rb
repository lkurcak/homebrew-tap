class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.62.0.tar.gz"
  sha256 "00f3307e106f2d5f8b0a1deb05cfa7d40e48ce85f10c55d61bdfb0ae135b40d7"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.61.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "417b399c29c69a7f4ad8ec24e629dd85487722c09c4222dde5707b6e4882828e"
    sha256                               x86_64_linux: "3babbff2222d8f1db84ac7a5623b4342909aa200522b73912a2a0b3246836331"
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
