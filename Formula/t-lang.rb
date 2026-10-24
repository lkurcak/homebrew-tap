class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.28.0.tar.gz"
  sha256 "cbf1cb88f592fa5bff5d66e1383e66b95b42291cc9919484ce374e0fee896762"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.27.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8a12f1ca1ee773a47d7405d69a2e991f75cd74335737b516b32784bd59e01fa2"
    sha256                               x86_64_linux: "c0dadc39df3c9f8ba03086b96d60b6bb54165040e875d1c8d932fb220e350028"
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
