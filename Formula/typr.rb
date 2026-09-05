class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-0.2.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "dd612f38771ef413140cd42ad47e39cedd459ab035201dc9ea9068c71f8e4399"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9e197f99ba5eb86f824c7d0d7a34641a29a742684c8cddd6b5d0d2ad7a03d26a"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.5/typr-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "d95062af620ed0df17329852313d88dd4963e912ff09a639b500ffeb05bca9b7"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.5/typr-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "d95062af620ed0df17329852313d88dd4963e912ff09a639b500ffeb05bca9b7"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.5/typr-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "65a7a48c34a4b0080591889b20af1d649168744ce4e2c07a1c9fefe9851cf219"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.5/typr-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "848f6388e3a5a4e72244135c66647dd9e9416cb23913f7e6177f9b0086aa5ddf"
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
