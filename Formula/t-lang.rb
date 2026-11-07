class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.63.0.tar.gz"
  sha256 "4122de2a0455eb4e8bfa0d0f19a3204b2786226a92133cd6f51e9ae0591fe488"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.63.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "11e65111b89578568f53040a6f5ab0361df546fbf35b9aea3e2302b9dbc8c982"
    sha256                               x86_64_linux: "acc842449d2fa87951f750e23e8256db0e9e81e98e9c30c81c866bc3aa22a0fd"
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
