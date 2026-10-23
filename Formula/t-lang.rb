class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.24.0.tar.gz"
  sha256 "65652258a362b38ddc5710d0c73dd52d78628e6339805957caa0d9a5aef29dd9"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.23.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "af207de10b1e61605d8c082e4ea7ee3c63d5536fe0c48687e7286c0df9d8acf6"
    sha256 cellar: :any,                 x86_64_linux: "fda852f07a4315dd6e37d9f5882b3603d1ac4d4f0eb7160c4990997972e9e203"
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
