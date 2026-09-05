class Typr < Formula
  desc "Small command-line typing game"
  homepage "https://github.com/lkurcak/homebrew-tap"
  license "MIT"

  livecheck do
    skip "The upstream source repository is private"
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-0.2.8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6f1a3978ce709b747bb04168bdf002cfa9654bd3c2864df4c75d412ce67242d6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5cd1d7722dce4b3b7e968db8ca89f9c9802052e22a3492f5ff34a58239d50104"
  end

  on_macos do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.8/typr-v0.2.8-aarch64-apple-darwin.tar.gz"
      sha256 "e3518f172bda3ce5ff5c959e169b26cc7258b1d7327144ba5dd1fbfed3f43749"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.8/typr-v0.2.8-aarch64-apple-darwin.tar.gz"
      sha256 "e3518f172bda3ce5ff5c959e169b26cc7258b1d7327144ba5dd1fbfed3f43749"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.8/typr-v0.2.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d7bf91eb8a98e0cb865428f52213ba3e0a760a5dbbb73c9445914a95f4a7728"
    end
    on_intel do
      url "https://github.com/lkurcak/homebrew-tap/releases/download/typr-dist-v0.2.8/typr-v0.2.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61b24ca4365d642f1e18b233e4a57f6560cb132048bee61ce76e45be7070cf5e"
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
