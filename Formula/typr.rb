class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "345108ac4d940fde49630eb805b0d68ddf39957244b24cb6272a2060b7f77114"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8926e0f26ad398e531d770b83d78f2751c3632f5782bb36cc5df01c618bc2fc9"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.1.2/typr-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "72227008d5f8ee39de7ab2d11260a0e283bfbcbf0dfc2a845a615045031d2c7e"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.1.2/typr-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "72227008d5f8ee39de7ab2d11260a0e283bfbcbf0dfc2a845a615045031d2c7e"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.1.2/typr-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f0df33dde1bda24e399d376f13941eee7254908b4841f816e87de084aa8e6ce"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.1.2/typr-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b39dbd1d29caee85c585d45223c7ff2e6bd1abdd1082ac9a20b45ac00a7a3ee1"
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
