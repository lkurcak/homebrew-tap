class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.102.1.tar.gz"
  sha256 "e5a0a2097c1bef8dc3ca712d55f45d69143e7ab054b87811bd2b927b05eaf7be"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.102.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7ff6202d0d187b952d465e3884e497bd2f490da4190bc877035c8116a245bc29"
    sha256                               x86_64_linux: "7598328370778c4d276821d7f87fc6baf070d85590b0731f14656459fe50f3bc"
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
