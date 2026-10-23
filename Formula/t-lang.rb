class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.26.0.tar.gz"
  sha256 "1e2994c7a6abc5990aafb0292bce1d757f1b022cd8b3ca5b55beab93f82aab9b"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.25.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "517ed368f7904c0c3390bf505e5679ba9b0ceacb9fa783dc153739408f349210"
    sha256                               x86_64_linux: "9714e92e66e21293a67dd7537362ed13322848e2b575a5b961569ce44e1713c0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"fact.t").write <<~T
      fn fact(n: i64) -> i64 with panic {
          if n <= 1 { 1 } else { n * fact(n - 1) }
      }

      fn main() with panic {
          print(fact(10));
      }
    T
    assert_equal "3628800\n", shell_output("#{bin}/t run fact.t")
  end
end
