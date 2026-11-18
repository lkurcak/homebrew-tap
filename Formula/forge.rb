class Forge < Formula
  desc "Keep a GitHub account's repositories in line with one manifest"
  homepage "https://github.com/lkurcak/forge"
  url "https://github.com/lkurcak/forge/archive/refs/tags/v0.11.1.tar.gz"
  sha256 "7f41e927ef7c0ae13e81ced6bcd1812e3b80b9064076eccd222f27e3e41b9831"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/forge.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.11.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "87dd1339865945a787b62f80a66693ded19f132732b990f43bff32af761e72b6"
    sha256 cellar: :any,                 x86_64_linux: "5c538bf2bc3b2eede78fed76c7c639982eff3b7c57c18bf537dffad3d42705b5"
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
