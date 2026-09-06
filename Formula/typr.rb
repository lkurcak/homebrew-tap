class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.14/typr-v0.2.14-aarch64-apple-darwin.tar.gz"
      sha256 "4b685432afd66d39bfdcae345d83390c6589f171d6f474fc5c357a4b8f841b76"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.14/typr-v0.2.14-aarch64-apple-darwin.tar.gz"
      sha256 "4b685432afd66d39bfdcae345d83390c6589f171d6f474fc5c357a4b8f841b76"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.14/typr-v0.2.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83a9f9431d13b4be2784cacfd9b61257823988d85db40fba67684abcfe8b3d03"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.14/typr-v0.2.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c97db106d70d5cb99694bfcb6953855051dd3106d498d3193ecd5582419fb84a"
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
