class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.16/typr-v0.2.16-aarch64-apple-darwin.tar.gz"
      sha256 "104c7634742fd01f619e025c9b71a3aec8d65a14a7e814a79f895e7fc781536a"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.16/typr-v0.2.16-aarch64-apple-darwin.tar.gz"
      sha256 "104c7634742fd01f619e025c9b71a3aec8d65a14a7e814a79f895e7fc781536a"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.16/typr-v0.2.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d13d8b215b70039a513b61b5e8d4f248465b779925a0ff45dab95c4b4229391"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.16/typr-v0.2.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e92625648fe15a5b131576a5799c5141846ae27a96ba3c9980efb575b6176d85"
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
