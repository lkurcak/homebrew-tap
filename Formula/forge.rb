class Forge < Formula
  desc "Keep a GitHub account's repositories in line with one manifest"
  homepage "https://github.com/lkurcak/forge"
  url "https://github.com/lkurcak/forge/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "d1ae71723445d6a07598009076cd9d6a0f25f043fb3285869c86f586626f4ef1"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/forge.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.11.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4ee0b0a42e49bba9eb5e3b35d36738224cc0db80e41c2a098964bc2acfd27cc7"
    sha256 cellar: :any,                 x86_64_linux: "4cb1eb7b4585bda77f9992ea7aff7f23f65fee64120ce12638686f785aff43a6"
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
