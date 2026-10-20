class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "d19d772607288c61b739841eba9625036300b4ad275099686b38fbbfc8af539c"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.12.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1cbeb608fe8e6f5968ad6097e9e317c4214b528b7d7d9ba05e69b61c30604210"
    sha256 cellar: :any,                 x86_64_linux: "fc5eafd72b9f6efc76b56cb5426239ea52d9f7363052bcfa58d62195d2fd7930"
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
