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
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/gud-0.1.8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "81fc70bb9c50c52ea9fae2da58be3a3e6c6a6e516f7ceb6286755fb64f61f9d5"
    sha256 cellar: :any,                 x86_64_linux: "aa84daf8e37cfef2bfdce4b206238e4d2d6cecdf05b2fc6ad11496f95baa8f33"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"gud", "--help"
  end
end
