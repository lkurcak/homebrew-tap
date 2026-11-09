class Forge < Formula
  desc "Keep a GitHub account's repositories in line with one manifest"
  homepage "https://github.com/lkurcak/forge"
  url "https://github.com/lkurcak/forge/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "7b013874a7283361a24ea147e85f2deeee65dd344e05303e499f841b0dadb5b8"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/forge.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4255ec85188631e3b555953f893afed03645cca909ea7e479cc06e942727a8d0"
    sha256 cellar: :any,                 x86_64_linux: "f50939426a37acd9ec7c25b2852d38d0dbcc733ee4bcd8212fc09e4ff64f5928"
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
