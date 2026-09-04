class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.0/typr-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "6edec530c19759bfedc4fadb9ef05d834e932fdaa363eb7591c898b02ca7ac30"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.0/typr-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "6edec530c19759bfedc4fadb9ef05d834e932fdaa363eb7591c898b02ca7ac30"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.0/typr-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3607c7b3c67a8a552ac216cb11dab9a4fe12da9563ad23ecfbac4a2cc8c1396a"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.0/typr-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d7f2a2ae158def5a2e1b5b5ee0c7ae59c17391a1de44be3ccc24ef1e8be2560"
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
