class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.80.0.tar.gz"
  sha256 "f9f059bfc0c0a821a094f92ac622c820b5bba46f46451a0b73e8f31e784fbcc9"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.80.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "cc5299fea6be5fc40eff2f190fcc3052ce37dd0d4a1a482d721d7cfcd2f341fb"
    sha256                               x86_64_linux: "20ced3a01d5936cdbc69eb26f669b451b993f884b0eec0b9af7a114c650c2235"
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
