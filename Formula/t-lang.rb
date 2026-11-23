class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.107.0.tar.gz"
  sha256 "520194af39416ebc183285b6a7275395ffdd4f9453c0aa4bc540d524187e2091"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.106.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a9dceae1e53f95799102b244c316a04206e23cce66a598ae3e08e096f77f1f27"
    sha256                               x86_64_linux: "b107777f54352baf1da4ee34a5dc3681121f7ac28b6df8dfff948ce24aea3612"
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
