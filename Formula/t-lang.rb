class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.58.0.tar.gz"
  sha256 "7a944db6fb1b412962604fe920ac38dfa061cf4d06c9b5a402be346ff5fec1b8"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.57.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6f0785b71333082a98b07692a777872875a978951bc852a74272ede1120bdf4d"
    sha256                               x86_64_linux: "8df3357416e99ac3b982944f34739c2b9a38ff074aa180fe647d1f99dcc282d7"
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
