class Forge < Formula
  desc "Keep a GitHub account's repositories in line with one manifest"
  homepage "https://github.com/lkurcak/forge"
  url "https://github.com/lkurcak/forge/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c026f0b3b1cbe4885d0df6186de711518c690ba3d664b03d0c911dd165582aaa"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/forge.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "849489b2f2be5d468fd33aafc8fe0f49008d6fe6e08cf142780fe65b337bb63d"
    sha256 cellar: :any,                 x86_64_linux: "3adb3a1e9c08852539e46433c93434053729f6629f16afa4c754c2059ad8b7f9"
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
