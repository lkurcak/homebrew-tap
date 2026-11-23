class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.106.2.tar.gz"
  sha256 "a4adfe2e060f38ce4969dd699a48a67553387cbf4c1230208fb67781d1518b8f"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.106.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b937eca0d5bbb81e82faa2a31a0032919ca0d4d5f1495f67dfbd3f6ca0893cb2"
    sha256                               x86_64_linux: "5b80b7a1cf81fba22e50b9ec5f8b26c1f32420ba9cf0870400b515393fef2697"
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
