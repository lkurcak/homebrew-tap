class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.97.0.tar.gz"
  sha256 "52dd469fbd6ecfe78e84e289e77d28f794ab43cb3a6df46762a444813d8a943c"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.97.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3bed2298c09d5a7ab85036c10a15a1d2880a124df118cc218dbc3adf75dfb7c1"
    sha256                               x86_64_linux: "c0c57adb3e71b56d9b7df634eea373548c59522e5d021c316af5050a480337b3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    # The test's program is t-lang's own, so its tests keep it working.
    pkgshare.install "examples/brew.t"
  end

  test do
    assert_equal "3628800\n", shell_output("#{bin}/t run #{pkgshare}/brew.t")
  end
end
