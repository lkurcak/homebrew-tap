class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5e248daba229c897000fbcad2705233fdba1a81516bcb351fff9e2c9a1189212"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "782da8a44876ab88d4f5cce2a5ff1a4d84b68e92b5af7a2db084e8f5bf613161"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.1.1/typr-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "b1b56065f6ec07035e48f77d06ac1a2d8802aaffec07b8c289e06ec1ef01d6af"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.1.1/typr-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "b1b56065f6ec07035e48f77d06ac1a2d8802aaffec07b8c289e06ec1ef01d6af"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.1.1/typr-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e44c60625f3565d505905e2b23bba6920fd135a2011793da1f8f0fa904f4dc4"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.1.1/typr-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ac08dfd8c6a7937c1bb0492e6d07d45759021f2414fff9068a0b8bb9d0183e4"
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
