class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.48.0.tar.gz"
  sha256 "ee7fe68c5a44e45cf9f8de0d176c7d1d9a44669b0c365a86dd6d815288450bbb"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.47.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "30cb3f5850df185edc404325ac2008363680998540809be894f9050f0caf1528"
    sha256                               x86_64_linux: "1f4e579c54dd8755561e008891934270e5168b77f318eb537d9be299602a6677"
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
