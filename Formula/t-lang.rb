class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "208c959da7fad248d1d6d829bcb008da46065c72a1b0b230eb8f14829e8d9157"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.2.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "83eb8e8e4cda76930b0fa62b519bebe6d8a45b587bc0237b13d2d7f96537d994"
    sha256 cellar: :any,                 x86_64_linux: "6e5e9503e958164d93d2347a71728d2960eb789fbb1bb0fd1f89f31352066631"
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
