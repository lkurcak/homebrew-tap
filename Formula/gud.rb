class Gud < Formula
  desc "Interactive git helper"
  homepage "https://github.com/lkurcak/gud"
  url "https://github.com/lkurcak/gud/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "5c73bf3d5ea2cbc3c3b57af2f4a36967f888f79bd2d66fcbb960cada246dd8d3"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/gud.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/gud-0.1.9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "11f669a52980ee552dfd81ce322a54d2ebf63d6badbcfea48f5f6ccc165aaf7d"
    sha256 cellar: :any,                 x86_64_linux: "d7b200cca5913e7937cbb2fc5c0f48c2110e7c782761f42a97eaed6de1a06716"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"gud", "--help"
  end
end
