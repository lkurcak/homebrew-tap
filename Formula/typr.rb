class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.17/typr-v0.2.17-aarch64-apple-darwin.tar.gz"
      sha256 "e6a5e553515e1d096f13bcfdbd85a2aac577448f6b6f67493cbd0a0192a25710"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.17/typr-v0.2.17-aarch64-apple-darwin.tar.gz"
      sha256 "e6a5e553515e1d096f13bcfdbd85a2aac577448f6b6f67493cbd0a0192a25710"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.17/typr-v0.2.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10c4e16514036159ad7dbb5561cf7696fe85b9fe56f2b28674bad4f66ece6496"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.17/typr-v0.2.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c634498123a9e372b669dd65d88e64f7d61d7a0d784ddfbddd84b611b4135f6"
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
