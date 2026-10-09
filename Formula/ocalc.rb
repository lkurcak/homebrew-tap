class Ocalc < Formula
  desc "Simple calculator implemented in OCaml"
  homepage "https://github.com/lkurcak/ocalc"
  license "Unlicense"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/ocalc-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1a4015036d830fec2965e8cecae2f5fc503ab63e97d0f74f0a49d6732447dc27"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0926bfd10d0c07aef9b0f0e66d11504ab8a90e0cf411865be032769501dca70b"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/ocalc/releases/download/v0.1.1/ocalc-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "a5ae27bbc061489dbec6b143aebfad07b84a920862fc7850f975fc626722cbdf"
    end
    on_intel do
      url "https://github.com/lkurcak/ocalc/releases/download/v0.1.1/ocalc-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "a5ae27bbc061489dbec6b143aebfad07b84a920862fc7850f975fc626722cbdf"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/ocalc/releases/download/v0.1.1/ocalc-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69397a32bed7a41e3a36ae04aa33dac521432af5dcb05bb9ec4aa777f599d91e"
    end
    on_intel do
      url "https://github.com/lkurcak/ocalc/releases/download/v0.1.1/ocalc-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b0b3f5dff4c6e51d82263ec06c0c261305980da8545484bd00f4f5b8fad2160"
    end
  end

  def install
    bin.install "ocalc"
  end

  test do
    assert_equal "5", shell_output("#{bin}/ocalc '2 + 3'").strip
  end
end
