class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.58.0.tar.gz"
  sha256 "7a944db6fb1b412962604fe920ac38dfa061cf4d06c9b5a402be346ff5fec1b8"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.58.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ebbd79b9bd1bbb0359df9c7ffb5b648eed3f1bb175edca4d2881855df5594829"
    sha256                               x86_64_linux: "070fb1ad2e1ca11db275676ffd0c1513d7552e7df5754a60b4d575825756eab8"
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
