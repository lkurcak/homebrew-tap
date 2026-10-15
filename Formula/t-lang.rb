class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "8851677b9311986d6b62903ec9bd1b7a18ae429e24164c34e1d0d648375e10b3"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.4.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "838029aefff1cf79f5bdb6f22d72dcbb61cf55ae2b255249dc260fd06af7d833"
    sha256 cellar: :any,                 x86_64_linux: "53f9a6dcbef11065f94ff1f8c607523c47f9ad3403c11dbe26ee792b4dcd2bec"
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
