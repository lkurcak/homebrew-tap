class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.100.0.tar.gz"
  sha256 "895fc8e84347d914d68af1da16c026fe5cbe9d29d1298faf2b205cfa3c03a4df"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.99.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "47b97baf4676d34efbb8bffa0cef6efa9b59e1e96f0362256019ce4701964ad3"
    sha256                               x86_64_linux: "b01fa4cd9f2dfa27c7c4bb96b58001324af85e699df552441e37be7f79dc05cf"
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
