class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "7e824da33f99a7563996f33e41b667f770557d5b4867e1843f6fa2e390311698"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.6.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0353212aa1ab1f2c29be7c4285d9e2aba950d04a7ce3acc93453518d812cdf3e"
    sha256 cellar: :any,                 x86_64_linux: "6547b5ad2e24527d598c3f7c61f973725fefe5c90b735b688a9541d5de3dfa5e"
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
