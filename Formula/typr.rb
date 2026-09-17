class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.18/typr-v0.2.18-aarch64-apple-darwin.tar.gz"
      sha256 "45da82bd6d5541eea07e74b8b5641f9971525593275c1ec0d5d09201ae5fac7d"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.18/typr-v0.2.18-aarch64-apple-darwin.tar.gz"
      sha256 "45da82bd6d5541eea07e74b8b5641f9971525593275c1ec0d5d09201ae5fac7d"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.18/typr-v0.2.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6babeee75f3731c2f1782fbc7c6a1f096104913f7f3227025dae1b766f4df8e"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.18/typr-v0.2.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f14f18732fb4be9b739f6e34616e371132a7468a35744699bd6937df7d97a9a2"
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
