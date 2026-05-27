class Ghelpr < Formula
  desc "CLI tool for working with GitHub pull requests"
  homepage "https://github.com/lkurcak/ghelpr"
  url "https://github.com/lkurcak/ghelpr/archive/refs/tags/0.2.3.tar.gz"
  sha256 "8f67b152fef35d83fa4c98096588e5e984aa611296c2d6343501278d770698fb"
  license "MIT"
  head "https://github.com/lkurcak/ghelpr.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/ghelpr-0.2.3"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9c6ea44ccb49cae29b936aa554036a456ce951ca4e29f66cc5b27966b8e6c72a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e542f6ec2db37c9cecaffa6eeb775364e0f848dd56df050ed32f1d195cd3c9fd"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ghelpr", "--help"
  end
end
