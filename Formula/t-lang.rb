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
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.5.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1d0b3eb4c6a5c44d70c0ef209d72104cbb638e0dd4e6f7624bfa81d378784da3"
    sha256 cellar: :any,                 x86_64_linux: "4217e5811adc024411598381f5c36f17a5f6bd2f5c8407dcf0429ffcceb81e54"
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
