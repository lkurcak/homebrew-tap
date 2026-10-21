class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.16.0.tar.gz"
  sha256 "ba2c7f483fb4976ada4219699874b78b729f8c476461e8b05bde33cb1d3029a7"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.13.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "037cf3f7095bd623380f256710970598d29b54c431df15136bbabbbb70dbf771"
    sha256 cellar: :any,                 x86_64_linux: "48278329b9ba9325aceba7219c19b9481a57507d540f62a120c8f6a60d087211"
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
