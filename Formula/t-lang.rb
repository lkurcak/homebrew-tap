class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "9e381715a6d745dc3e6dae272e982b5e099b3cf8a6cc3c0414b57cabe96a6fb2"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4cecb0808aa959ccdd2248da926ad0320f978aa6ea7d0842cb24b3eaf0d22ed8"
    sha256 cellar: :any,                 x86_64_linux: "c958de943b88badb52eb90b81f85f434c67efdbe09d9d1b32c29a706c18913e2"
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
