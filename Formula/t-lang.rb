class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.105.0.tar.gz"
  sha256 "fc51e4c1ae55a0343c8b44670084e0fa1ba740236323bb56479e5a9998726429"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.105.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "914b72f1636ce9b275746a79312a8beca2659da0cf538662f9779946b42f8fc6"
    sha256                               x86_64_linux: "79811b37cc7dfe141f22cf25bec10a4442f9b1e8f1a35d522cd3ae1a47fe0fe8"
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
