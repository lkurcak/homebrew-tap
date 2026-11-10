class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.78.0.tar.gz"
  sha256 "80ae53e3bfbb0657201e80fb29bb4b5304077913f885be728ca70c8e81348963"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.77.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1e97298685e5795d1bc6448a22579405a3f393eab7a905f680d2282db3cade5b"
    sha256                               x86_64_linux: "6a24064ea564a99780b74bd837800ad82f0f3cc5439e0aeb40c86f0c8ff87dd7"
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
