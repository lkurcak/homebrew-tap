class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.49.0.tar.gz"
  sha256 "1dfbfd0fc7812d1f71e7cb0cc2819148939458b9bb8fb13dd377647921d2edd7"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.48.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "323c13510cb6c383e7645222e64732917ee538c766bb4fa5512073b6d691affe"
    sha256                               x86_64_linux: "55796ad1d9d354f227923a94b68cff8bb67135e049971a886bf1cdb6564d0026"
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
