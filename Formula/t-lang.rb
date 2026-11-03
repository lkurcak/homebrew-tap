class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.53.0.tar.gz"
  sha256 "ee6fedbacd6a9e45446f8c7982a05267d3886c04953257de34d790ec090dc764"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.52.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c45bacbaf2f5abe18d79d2b7fd1e2ffa5ba43883abe3b7e967b03da0055024d4"
    sha256                               x86_64_linux: "3329ae39f8b38e5d783539b7a2f2c1696c4eeadbe1d68b39966be8ae0fc7c587"
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
