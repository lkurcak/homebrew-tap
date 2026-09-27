class Gud < Formula
  desc "Interactive git helper"
  homepage "https://github.com/lkurcak/gud"
  url "https://github.com/lkurcak/gud/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "c2068d92208011600575b8c7d2566093070aa3f88ec5c5a4a98254efc1cc3098"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/gud.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/gud-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "228c858d4c9b71a2f4175d1304714193df15d53642cd87310d98f1c5ac9b9d22"
    sha256 cellar: :any,                 x86_64_linux: "f4b359b5b1db001a5c686db1c25d780a62bd1d0ba43b51232f02531cba1ae23b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"gud", "--help"
  end
end
