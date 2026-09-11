class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-0.2.15"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "770956dda938c6c1d1e331c7921110fd4bd54b4b96f1b0d182b20afdaacca36c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "810742149d90b4657a52fd8a50fee120d7117e497599c6183bfed51dab9458c9"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.15/typr-v0.2.15-aarch64-apple-darwin.tar.gz"
      sha256 "f8065eff209f9caf227f29926eb859650134702e9482dc43212d7c2fd303f1fe"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.15/typr-v0.2.15-aarch64-apple-darwin.tar.gz"
      sha256 "f8065eff209f9caf227f29926eb859650134702e9482dc43212d7c2fd303f1fe"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.15/typr-v0.2.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "540dc0fb4b9684a55ddd39a028c670220eafb840869bdb6ec015e327ea0ca7e4"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.15/typr-v0.2.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "442907c472d5657bb2a683f2458272220490c853fff8573601f625347673b38d"
    end
  end

  def install
    bin.install "typr"
    pkgshare.install "LICENSE", "CORPUS-COPYRIGHT"
  end

  test do
    assert_match "Usage: typr", shell_output("#{bin}/typr --help")
  end
end
