class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.45.0.tar.gz"
  sha256 "54f2c62f73763fd3c42220378a8e19e1df2b05557dd5702b426c488cc7511dbe"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.44.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "56f746b785f790cc8afca62da297eefb57544f563c33edfe6e9847ab8cb08346"
    sha256                               x86_64_linux: "796a7c05489f03d457cbc024ba9cb54a91f91e305e4f7ad2e080a7f99b247d94"
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
