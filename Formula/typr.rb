class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.1.0/typr-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "ba5970669e079f8272c159261590b209459d32c1b008645b7c265468e53ba0e2"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.1.0/typr-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "ba5970669e079f8272c159261590b209459d32c1b008645b7c265468e53ba0e2"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.1.0/typr-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f860b76fb1666aff59787f140263b88ee4ff8d646a6f72c02b6ba9e08c284811"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.1.0/typr-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "72559aebd820ce60b27f729468711b6c3127919abeceea819ccbe8151d701b7c"
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
