class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "1d679da1ab11d25df67687dc26bb93123e5fb010bbe6a0221306a16812739165"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d1063eb3dd4860e3e52a4e096640b439ae4b7e3c4122206731279ff7cf106eae"
    sha256 cellar: :any,                 x86_64_linux: "7b299c232351adfc978f8375c8c19de0f290558f9598d97f84c7b9a9890cdba1"
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
