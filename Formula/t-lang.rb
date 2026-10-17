class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "83baef20e928364e2c96999f482df22b33d6aaa90c7137d430e152759aad7e20"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "10d79d132e434b6896a91cea6e1fba7fa278b91be5b1e66f5acd8f9cfa527626"
    sha256 cellar: :any,                 x86_64_linux: "326fc2e52ffdd6283b71f0e9c4589ea81d3dcda3bc51171c621bd03f6b9c5337"
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
