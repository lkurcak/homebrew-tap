class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.79.2.tar.gz"
  sha256 "7dc6da4ef06ebe6faab80c58eae595eeb999008d35698c093e9d495590526bb3"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.79.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f09a35f9240d01546469c572a5f8faa1b1d9ea001631f11a0fddfe4b90752adc"
    sha256                               x86_64_linux: "0a2d2de2e5734f5f5275e7eaac03464d185762f0ca80394eecbfc5e4fe4d2664"
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
