class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.25.0.tar.gz"
  sha256 "befa91ee2086aa2e64801129ddd675ddaa36bd9ce180b5d7b6c90ac8dbf3a391"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.24.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7014fe7cf27344949d80c23c898cfb191c56718829e85f24c4e59adca51c37f4"
    sha256                               x86_64_linux: "e11d2e8e8ff7a6df18674ad6b4868fbeb55123940ec0013be81c159cbfdb4a73"
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
