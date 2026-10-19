class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "bfe63d9515844a82d39806280dfa2ce87df419c13b933c29daf9863824da7f13"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.10.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "75b8e2e17e55f6490ef3954bb5fa063ee9981adb0e8faa59260a915460778f12"
    sha256 cellar: :any,                 x86_64_linux: "f77e099ad15ff8fa555c5a57ebcfdb06808be7d2b192e50e69534842a4d76d5e"
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
