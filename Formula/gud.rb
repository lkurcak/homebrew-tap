class Gud < Formula
  desc "Interactive git helper"
  homepage "https://github.com/lkurcak/gud"
  url "https://github.com/lkurcak/gud/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "f281e08077e1dddd2d7d5f85df2538b5de97a1453480fdac09f1708c1a14e048"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/gud.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/gud-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "024539212e65aae631c7d3326c058332e52b5db55255aa3946e2395fbb10f222"
    sha256 cellar: :any,                 x86_64_linux: "f6ce33b5b0518a2e1d71500233839c2b8ea4b7553cce901c47f344ad2dcbb646"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"gud", "--help"
  end
end
