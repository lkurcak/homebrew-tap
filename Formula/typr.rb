class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-0.2.21"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fc4af45d3c5cf20fde6e6d83a81d8ed3ea02eface65eadd16d9eb58bdf446c52"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "be02cce037c784cc8a00ee2003dcc43f953e0f28ed0ac37367e1c290b424a149"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.21/typr-v0.2.21-aarch64-apple-darwin.tar.gz"
      sha256 "2f6031578fd3cac2da4964c1e6f37e514c4e89a2e8c5b2f92a3180fcc5de48cd"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.21/typr-v0.2.21-aarch64-apple-darwin.tar.gz"
      sha256 "2f6031578fd3cac2da4964c1e6f37e514c4e89a2e8c5b2f92a3180fcc5de48cd"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.21/typr-v0.2.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83f3d204966e349980ecae1114b7cc1dc7299139a96bb2967553ac3bab0c6cd3"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.21/typr-v0.2.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73ac8d78c8ea20964d953a3f8df6f1d955d26e7f35bf1a87860c5850e404069c"
    end
  end

  def install
    bin.install "typr"
    pkgshare.install "LICENSE", "COPYRIGHT"
  end

  test do
    assert_match "Usage: typr", shell_output("#{bin}/typr --help")
  end
end
