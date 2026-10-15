class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "91e8fd8138346457f68422e89873de835f9bc895a29a74b6fe0311a577800493"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d2f24a09d774ccf2d45a8ccc68578b8b6bbe3b4ac23a81dba57ac3cbb760a2c8"
    sha256 cellar: :any,                 x86_64_linux: "ba245e2e9c59f1e29c058e5e925e42c1f84a095cb4c5460dbfc189cc4c11fa27"
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
