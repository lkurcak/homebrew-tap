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
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.31.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ed6e6af163120511b1b326fe83f9057c4b92f58a8a23111dc2a54ae2782c3347"
    sha256                               x86_64_linux: "b6d0c2bb9c8dec21eef6a6e05b007b3d8071b09d7eb5e3418422b35e912d7d72"
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
