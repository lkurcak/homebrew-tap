class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.4.5.tar.gz"
  sha256 "ff6db74b73402e27b6f954e3a85dbf91595b1acc7db51c06703f362a2c6cc7c2"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.4.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b538714f47d74662a2d6428dd47929e05bd0c05adc2b4d7e9fb92db4a312c4c4"
    sha256 cellar: :any,                 x86_64_linux: "9191206e5171e4d45c87ade29972e866b2b4eb7a9c10a993301338700de47b91"
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
