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
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.22/typr-v0.2.22-aarch64-apple-darwin.tar.gz"
      sha256 "8e17c72a2998b1bfbfb3d804d5ed600a639f9bc3c973b855a9ecd6b3474517cd"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.22/typr-v0.2.22-aarch64-apple-darwin.tar.gz"
      sha256 "8e17c72a2998b1bfbfb3d804d5ed600a639f9bc3c973b855a9ecd6b3474517cd"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.22/typr-v0.2.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "600bc719fe79e8ec8ad7c922023ae5e5aace0e276f439560322fc04c86cbe604"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.22/typr-v0.2.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "15a9966c1e882ae1f5f601fd71dbb341913b0c8ccf5cfa716b736a533c018871"
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
