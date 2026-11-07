class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.65.0.tar.gz"
  sha256 "30bf641e08626dd67132facf47affa4d83075bc1fad1ac31ce84a9c508aa357c"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.65.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "82d3cbee9419741fda27970d34905d6eafbc652be195b9bcf11f9a202e3c7ca8"
    sha256                               x86_64_linux: "d118dea8405a28e1119e00264d3f1a173accefb14536a1cfdadc2760b1b9076b"
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
