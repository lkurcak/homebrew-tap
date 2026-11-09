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
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "526c435d4050c366717a1d4a67e14a0f6d152d41a68630432359b9f753813f74"
    sha256 cellar: :any,                 x86_64_linux: "40642e48d1fd78b12a7067e0a05acc57c212f3849a4e0fb08999336e2e467d54"
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
