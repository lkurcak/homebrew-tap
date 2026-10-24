class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.29.0.tar.gz"
  sha256 "413124803961f7cac08a6c25de14087f3ec06cf1da8649652ec65638587bc954"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.28.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "adba6215e2540f63f15eeb2a504b145046bad239f71dcf30f4b80b2377fb5808"
    sha256                               x86_64_linux: "e622a4ed5db96486f6a928a91a11c569e45610df4ee2d1492096b21e798ac335"
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
