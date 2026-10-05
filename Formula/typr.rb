class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.19/typr-v0.2.19-aarch64-apple-darwin.tar.gz"
      sha256 "b8c672e7a0062a7ea7223b45268fb27c88488378f66d21d6e30651d94445c4c7"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.19/typr-v0.2.19-aarch64-apple-darwin.tar.gz"
      sha256 "b8c672e7a0062a7ea7223b45268fb27c88488378f66d21d6e30651d94445c4c7"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.19/typr-v0.2.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea1eda2dd85490e4a8e8f6e3cb33a05078a642d75fae63e53107e773b4b7179d"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.19/typr-v0.2.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77d4e2cdcdfd1f524545e61110e3f76107f45c518bcab6b0ec326cbc705d6ee8"
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
