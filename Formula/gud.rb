class Gud < Formula
  desc "Interactive git helper"
  homepage "https://github.com/lkurcak/gud"
  url "https://github.com/lkurcak/gud/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "81898e5769a8023d7e3d74a6737376a7150ed51a0e2f8c3ca0002c9b51a68783"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/gud.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/gud-0.1.6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a08cbc84d4efb2852baf5c4ea059a3670a7170101026091ef51f7069656ebe1e"
    sha256 cellar: :any,                 x86_64_linux: "09608f08f78fd65252c6c522a2c98cd77d4c3de79baefe76a492087d0df03a67"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"gud", "--help"
  end
end
