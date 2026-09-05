class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-0.2.7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "042a576e666f96a8bc45fc10cb8551617a4457f89f0ecba846e293188ff7d711"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3efa6387a1da6e4a28f447b96cbbb04838796b01d76eb33d45e24a9b221674ea"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.7/typr-v0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "b43e0befd6068e3a5397c2f6884d8eefd5e9312287dce9f77cb273780729f559"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.7/typr-v0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "b43e0befd6068e3a5397c2f6884d8eefd5e9312287dce9f77cb273780729f559"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.7/typr-v0.2.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2bdf8b6d6610881c0fc49b9afd52ba3ce6b011dcdf7c79297f75abf7304b11a8"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.7/typr-v0.2.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "50a7d4d4500f885894e96490fea6868a2b8b70883b0cb1fd6abfd4d9c9e73e23"
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
