class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.104.0.tar.gz"
  sha256 "3a1e3104342e1334f5bfc78bcb1c9b8d5159385c3828d8a3f1c6fac38eefc28d"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.104.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3289149c8a6ae4daec475222dcf2a931a725cd5a0c29c3598dc20d8cbc790f97"
    sha256                               x86_64_linux: "b9f69548c6118630b9bea62d86aaaf671958ed242596bf73ca345ff7964e8170"
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
