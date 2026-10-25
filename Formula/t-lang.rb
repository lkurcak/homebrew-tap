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
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.34.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4fe838629dbb3a96ec83f58d641b0a8796e5442d9fa5b82371cb5dc61767db1b"
    sha256                               x86_64_linux: "08def782419c0fb847314c98994d4af73ba13a0606fc67f9f448e2b86889a152"
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
