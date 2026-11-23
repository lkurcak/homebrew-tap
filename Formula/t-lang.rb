class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.107.0.tar.gz"
  sha256 "520194af39416ebc183285b6a7275395ffdd4f9453c0aa4bc540d524187e2091"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.107.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a6f0d8168dffcb64be72a21bd27d7ba070cb80af89536018d2d87f61cd24c93a"
    sha256                               x86_64_linux: "fd8bfba12f1942763437458520fbcb82a9ef4a46dd6fc9b79c67bbce554471c9"
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
