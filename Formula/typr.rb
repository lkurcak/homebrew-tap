class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.1/typr-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "748d3e01c12028d318d0ed0bf117e0eb41f3450e3c115d34036f2f45ba1392a2"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.1/typr-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "748d3e01c12028d318d0ed0bf117e0eb41f3450e3c115d34036f2f45ba1392a2"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.1/typr-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b4b5a9420b589b0598601fe38ee80b034229b76972fcb024c7ac0152495500d7"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.1/typr-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a86a7b81b2bded0ef5172c7109407f0d171116ec226e804ebb73e8d2ccaca1a"
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
