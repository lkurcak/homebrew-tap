class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "95f1c8b4b1152f7b74d973ad644583b59f66e19dd01c8bc6a1c85a52b096d40b"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.4.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "590656efd2a64e766500edb4e975e2823f7588039b9fff183b7d91d904b6a00f"
    sha256 cellar: :any,                 x86_64_linux: "50567acd4b19fb526788cb4f2da93ed394bea2a1c9e8600262d83bc652acdca2"
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
