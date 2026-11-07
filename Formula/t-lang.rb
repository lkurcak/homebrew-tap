class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.64.0.tar.gz"
  sha256 "9484d064b97fc17820c646dab157ba29dc54d93f78f71a19c3bae300dfc293a4"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.64.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f648d59dc6693e316d1dbdd773fac71b544aedb37304227f1e05ea28b8ebb563"
    sha256                               x86_64_linux: "153a401fe73a1f8c8a2eaf7c6877e8290a39c89aaecd3c0018b8f5a5f7eae027"
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
