class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.69.0.tar.gz"
  sha256 "aa0b9b151a96207f1198d3b9f5c1c708dedb38b01ace234d15067e788ec9d12b"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.68.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "46d508a46a9efb44abb32f940ef0aa18388bcbd4451148dd7b6e4f5f4a0e6024"
    sha256                               x86_64_linux: "2149257d3569ee3a508c9e91f66a3cec377f6051b544cac3bfe3be1f5d8f8b21"
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
