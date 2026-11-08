class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.72.0.tar.gz"
  sha256 "fc63ada45d84102ab77b5d15b38de36c962a32b05e587ae8a99eb9f8653ee1df"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.72.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "cf77aecc1fb3f32988b709abe76b8f2453c0ba47aa9b76af5fe521bd80c8757a"
    sha256                               x86_64_linux: "b5c7b3c1b2d6326387609edad03007f730ac02bf486d1324cacac9132c25e3e0"
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
