class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.83.0.tar.gz"
  sha256 "eb5b00e71124415cbb44b853302f8e4283f628c3c7e5d17ccc13b63e0ccb32f5"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.83.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "81090dd8677bbf3b9bc0a54a5835a6a4278317b8353ee8e2d9247c117a8b3cee"
    sha256                               x86_64_linux: "1cc41ac63c7d170273edf01e1c2b0c18f93a0f3540a8f31ab158db3bfaeeac6b"
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
