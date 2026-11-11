class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.81.0.tar.gz"
  sha256 "54f6940e019046678699ba8ef28bb51a4a53321223acbc7476310b860e358fc4"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.81.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7a73862d8a715e105871140f6835b99aac7fc5db8d51cba691e58ef86d6cfbc0"
    sha256                               x86_64_linux: "6f17e80af03d0953293fd008f7d5a129518cc1bae8bf5aea354396518d63a764"
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
