class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "91e966432c82199e663ac33ce0e12ff59a1e477e714789d7d6fc2eba94152771"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.7.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6cc618b220ed8565123d5b0248b9b5e29f62d9eb924845297f48e7378f1a80a2"
    sha256 cellar: :any,                 x86_64_linux: "a342d31b5f4d62044163ab814cfa6b99812ea05b815dbad08790124d314215f3"
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
