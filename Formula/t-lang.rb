class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.30.0.tar.gz"
  sha256 "bf5ffe91707aa598bcd959992873b37ecbf00a59d44ba163ce7bc92a950c949e"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.29.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8782de763ddda76c11f93bb4ced1b7e5f2f09608817b217094e97671ec77e768"
    sha256                               x86_64_linux: "e92e07a4dc65ae9cb8501e1eb98cc45a560d89fe7db3218c2572d525dc5cef46"
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
