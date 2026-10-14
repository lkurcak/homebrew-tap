class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "7f230f73f273091a7ed288905f96df4feb149a4fcb6dd3db52725acc8ef632ed"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.2.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "852509928cc9d82c91c1960f50892aaa36e495ff8e89234abc7a6754f736a6b7"
    sha256 cellar: :any,                 x86_64_linux: "062873c5a9cea40bd79cea586fb4fb16b6138fb87b7591f365a1aca42dbebd9e"
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
