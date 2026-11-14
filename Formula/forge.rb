class Forge < Formula
  desc "Keep a GitHub account's repositories in line with one manifest"
  homepage "https://github.com/lkurcak/forge"
  url "https://github.com/lkurcak/forge/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "412e5e8ea27a0f7a4dc93884b85bd3f3475475f414ed75eb97cf11eaac76721e"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/forge.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.9.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8fa3a8ee8fefaf27c00b7415e6bdc733d8331962c845539bfd976733db09d22c"
    sha256 cellar: :any,                 x86_64_linux: "3706cb3bc5318e7e2eff784a7bc02cc45fed261341cab7b52f8db85a407f6b82"
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
