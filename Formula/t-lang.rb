class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.31.0.tar.gz"
  sha256 "1f339544cdce85746fda86ffbb1876737b53d872714cfb9b1059cdaa56994172"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.30.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7c6b941e1997c416458a9130b6e13adaa42a7c632bbaa9d25164e6c3de0c3225"
    sha256                               x86_64_linux: "6aefdd0fb48ad725b8a45e0b9118357b16099f086b7e154bf9478504af2f4dd1"
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
