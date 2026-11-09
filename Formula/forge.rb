class Forge < Formula
  desc "Keep a GitHub account's repositories in line with one manifest"
  homepage "https://github.com/lkurcak/forge"
  url "https://github.com/lkurcak/forge/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "1544dbf52e0a452747dc81168e3624b5780c2cd62b459975dbca844f4d072d81"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/forge.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e11d94ba017c27aa8399fbc57c029ecd885f62653b4dacbb95bf967e77663421"
    sha256 cellar: :any,                 x86_64_linux: "0950fd4288c9844bf113ce6bf3499f89e74e6cf771fd0b39a58d3bf889ce01db"
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
