class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "fe4ce8ab1a28425c96c4700a1662835e61694269d899014e7f37a6937c3d1908"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.8.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "282e4e857f611ccc019ea399f1c31e2cc66b30069bf6f9d4bee32ba7bb16eb6b"
    sha256 cellar: :any,                 x86_64_linux: "3bd9cc8cf580153fc4529cecd314c4cc43ac76a303844c4bead47455562126f0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"fact.t").write <<~T
      fn fact(n: int) -> int {
          if n <= 1 { 1 } else { n * fact(n - 1) }
      }

      fn main() {
          print(fact(10));
      }
    T
    assert_equal "3628800\n", shell_output("#{bin}/t run fact.t")
  end
end
