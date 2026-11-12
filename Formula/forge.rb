class Forge < Formula
  desc "Keep a GitHub account's repositories in line with one manifest"
  homepage "https://github.com/lkurcak/forge"
  url "https://github.com/lkurcak/forge/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "89f4e2101612577b7798e05598e22ba40d9603ad17463c45bbc5fc09907f9b90"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/forge.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/forge-0.8.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8efba0c188d666b770ebcc08aca53473d775c0ce6a540d63b4f160e3d5bac30f"
    sha256 cellar: :any,                 x86_64_linux: "c3678004a1360f4b9c9f746c859bd192e6bb8c5ec0a6ba05d21b1309df6245db"
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
