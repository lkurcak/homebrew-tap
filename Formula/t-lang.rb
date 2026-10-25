class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.35.0.tar.gz"
  sha256 "ab9207962be7be3e60a64e848a2d6498860d6da12261fc0df2116933c747e382"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.35.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b5ce949abda1b6008b9ec0824e5bf43bcb733cae7796d4b9a6890911a19b5800"
    sha256                               x86_64_linux: "aecc01e60d859e791f9f53d5e9374272f566677aa3fb51cc7183ae550d61bc65"
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
