class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "4706725d57021e913b70051ea618f8573549a6340979a253d23525f5a4d2fa6e"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.9.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "43c1b0b24e1c2e7ccab0369f8bd6cb238afd742c191cf26adfac73ac7a65a00f"
    sha256 cellar: :any,                 x86_64_linux: "995c4b277afa00acd5cae52e5ffb2e4c928adb1f053aeb15e4f075ec6dffbcd4"
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
