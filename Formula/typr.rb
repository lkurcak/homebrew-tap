class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-0.2.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "311bc4e02c9fed51b7410fd7ba73c2bd9ac7342f3a3a4cd02e0615c424308ade"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "62307cb2e14b397c40f577138a196e58733688f2af78ec274f053178dc89e4b2"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.4/typr-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "fde36c74cc94ef074dd072519a34c2aff3cf1e6066f045cf8b73d23f06207819"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.4/typr-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "fde36c74cc94ef074dd072519a34c2aff3cf1e6066f045cf8b73d23f06207819"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.4/typr-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a9b440e136b954aa47e0a118e1f72415e261c45fe5c1efc6b4b6a81162ab781"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.4/typr-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41db23bed85fb11ce304bea49629b63ef330acde20c8467eab6dbed224f407c9"
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
