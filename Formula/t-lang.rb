class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.39.0.tar.gz"
  sha256 "1d5cbf9e05d48b44688157fd45c659997e4adbb9182864bb7035639c116b25dc"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.39.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b26a71ce7403bf31ccdef473ab074ac3a535a9caaeec27fc6b68fd87e54907b1"
    sha256                               x86_64_linux: "27ba2c111270a6efc722df211705196981444c0ac3bbf95e9371c0773869ce63"
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
