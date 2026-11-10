class Forge < Formula
  desc "Keep a GitHub account's repositories in line with one manifest"
  homepage "https://github.com/lkurcak/forge"
  url "https://github.com/lkurcak/forge/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "c9c529e2c522255b6c2efc75180ac6c7b141433d31813f2f956024f5f8cbb113"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/forge.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.6.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1621629e8d97d20a98f60890b367a220a6fea22bb94140aa8879f7287e078fec"
    sha256 cellar: :any,                 x86_64_linux: "52dce9e6a8643be58757fdeb45db2c875cb608841a7d91e5c570b2f462f4c0b6"
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
