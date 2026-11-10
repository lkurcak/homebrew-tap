class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.79.1.tar.gz"
  sha256 "d0188dfcf6de84f35ffe3867899e91af3b4e0f942d86aeb9ad3276b8282c6148"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.79.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8b1259ef06ffdfe2ec4dbf244009775efad9a8ee8272884a1fa912dddff47825"
    sha256                               x86_64_linux: "e10d88e974e89790d237e4f85c58a0ae7bcc652f397ca02ef8f5a9490675038b"
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
