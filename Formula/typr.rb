class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-0.2.22"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b57a9ff450370d9ceb5c7e2b5024767c2339124d2bad3c634c072f66d3291c5d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4c8e7c02921039753e86bf2489f654f3b6c09d4e57c9881f02a762b67ef405e5"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.23/typr-v0.2.23-aarch64-apple-darwin.tar.gz"
      sha256 "3a1aba2c22a7945d978abe8c0a61b3f02fd90b585a19ed14af8f28c090919ce5"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.23/typr-v0.2.23-aarch64-apple-darwin.tar.gz"
      sha256 "3a1aba2c22a7945d978abe8c0a61b3f02fd90b585a19ed14af8f28c090919ce5"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.23/typr-v0.2.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4516e94a343991ff4b64a1be1c22660f608b22d3128f0c7da562a2bedf31d6a2"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.23/typr-v0.2.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f44e216f44322b8365eed42d158aeca80d94cdbaaec6313daa8f526278adce4d"
    end
  end

  def install
    bin.install "typr"
    pkgshare.install "LICENSE", "COPYRIGHT"
  end

  test do
    assert_match "Usage: typr", shell_output("#{bin}/typr --help")
  end
end
