class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-0.2.9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "df04100d3986b6c5497fc42d45953b0f6cd322dc868afc15eb68392a076f1f77"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "74cf3afe1070afef46f3176b0f5fe1fbd542d66a7d346d14db4198442f44d587"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.9/typr-v0.2.9-aarch64-apple-darwin.tar.gz"
      sha256 "c6c58def971011171c093b6fd770894b50b503f69d8e266e81c2b43137f04b3c"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.9/typr-v0.2.9-aarch64-apple-darwin.tar.gz"
      sha256 "c6c58def971011171c093b6fd770894b50b503f69d8e266e81c2b43137f04b3c"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.9/typr-v0.2.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eaee1a81549997246183fd4b3d2b8318a9e5baf8648edf1cf996766410b31b68"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.9/typr-v0.2.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efcb5444eb23decb1cf7345aa8ffb167b73771caee0a8e831bd0813172adf118"
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
