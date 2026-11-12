class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.86.0.tar.gz"
  sha256 "7ddd2be0f349d0f259d652e0f9f34a1a8a6a8d674adf5735095f399b704d4458"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.86.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "485928db9875aea187905da33967ac03e33c35451d752995c80ffd26accfea60"
    sha256                               x86_64_linux: "8742ebd474a2adc0f8f035efaccd4d73cc16735fc26476536c0fdc194dd0e2af"
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
