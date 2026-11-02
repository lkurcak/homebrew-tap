class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.50.0.tar.gz"
  sha256 "6fbcdc6f0e97fe80f2b2b823a00a6d8a00e286715e07af87d3040318f714a236"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.50.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c747b2802dac936cfac03911693065ec8033a8e7a4bba8cb31ca3536dbd47989"
    sha256                               x86_64_linux: "da6fab7c52df76d45b820f4578f9c5b470499985c61137a4821e47164397df8a"
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
