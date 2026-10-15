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
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d5141c870f26864d808a0d9f984b7dbe4758f9498ea16140efb25db7db19fa58"
    sha256 cellar: :any,                 x86_64_linux: "14033c9827e2a60264f2f7e66f30c41e960d9fe1c683a11b39d57c95fa55961d"
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
