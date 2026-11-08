class Forge < Formula
  desc "Keep a GitHub account's repositories in line with one manifest"
  homepage "https://github.com/lkurcak/forge"
  url "https://github.com/lkurcak/forge/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "670f72dc16a929bf6b913e0564b4f807d3bdac7f5ef7ec536c2825b19cc7b788"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/forge.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b05fd205a391a1715f1967fc7aff8cff018bd2d5a78b38ef29078f853d04bc3b"
    sha256 cellar: :any,                 x86_64_linux: "3d7fd7a9114a20c79813f4cf7d4d0c59928368279875c504e99e65aff72f0ea9"
  end

  depends_on "rust" => :build
  depends_on "gh"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/forge --version")
  end
end
