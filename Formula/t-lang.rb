class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.91.0.tar.gz"
  sha256 "49aeaba36e5d9e2822d292e36eed42d1a6fc222479799bc15fd38a45ca977c4d"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.91.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "58d7a0e7fccdcb58736f78ab54bb434309b5a8ca9c7af62876d13cafc0d93fe6"
    sha256                               x86_64_linux: "6af7beb3c8a967d29e6a8b8973e0bf698a80d05f5bb8965ecf9cba9ed147399f"
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
