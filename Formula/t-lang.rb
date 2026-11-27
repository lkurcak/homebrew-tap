class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.109.1.tar.gz"
  sha256 "ce776d6ce537cd5b208ab32718a32dae90410fe766e90c520b7aae6ed3d9e2c2"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.109.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8307ba045b1efcd3b4b3e6b2b090075e99f1a1455729dc90088cc0cb7aac9774"
    sha256                               x86_64_linux: "6966e3a39d514004eb23c211e8ac5a697ea03c4a1ae954bba2fe134ced317241"
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
