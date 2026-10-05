class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-0.2.19"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "68578425e9dae3e10b1a7c69859c651fd790dd771d77af9cea8480917e59c31a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "51e191b79ad6503e43995c97c501fb29e8e5510bc2917ba8ae951b0a9f4c7ff3"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.19/typr-v0.2.19-aarch64-apple-darwin.tar.gz"
      sha256 "b8c672e7a0062a7ea7223b45268fb27c88488378f66d21d6e30651d94445c4c7"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.19/typr-v0.2.19-aarch64-apple-darwin.tar.gz"
      sha256 "b8c672e7a0062a7ea7223b45268fb27c88488378f66d21d6e30651d94445c4c7"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.19/typr-v0.2.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea1eda2dd85490e4a8e8f6e3cb33a05078a642d75fae63e53107e773b4b7179d"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.19/typr-v0.2.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77d4e2cdcdfd1f524545e61110e3f76107f45c518bcab6b0ec326cbc705d6ee8"
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
