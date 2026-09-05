class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-0.2.6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e0d08e77e47eef675dad317e6a3f6459541ca17cd28a9e56e9dfdd1a647eb1a2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "abc723f63a5b4ff62bd9a58f7d0478d6e62838d942685f6c0d09380b77e55555"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.6/typr-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "fea50252a63cc7188734c97eca5906a06f8b32941deccabc2ffbd3d6ac3ac0ff"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.6/typr-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "fea50252a63cc7188734c97eca5906a06f8b32941deccabc2ffbd3d6ac3ac0ff"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.6/typr-v0.2.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e274df9b8cd69669f6ce218497f54b3d62db02d551cc07a1f8591f5cfe73e1b"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.6/typr-v0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e137a2700065ecf7cf2072e91f2ffa20a84a5ee06b3df223b676e6551d8b38b"
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
