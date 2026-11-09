class Forge < Formula
  desc "Keep a GitHub account's repositories in line with one manifest"
  homepage "https://github.com/lkurcak/forge"
  url "https://github.com/lkurcak/forge/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "7cb765aa8cd8358715ec99950b49a439237854b31eefdbe62cc84d05107649fa"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/forge.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "235398b9f9627e80e9ff7665143e4c0fde971664737bbd23cecee107368a9593"
    sha256 cellar: :any,                 x86_64_linux: "4edbf8af20ff15f42c6649c4ff2cec2de856bc333b5b83a3cc11f201e3ad74ea"
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
