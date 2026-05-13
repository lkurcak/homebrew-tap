class Ghelpr < Formula
  desc "CLI tool for working with GitHub pull requests"
  homepage "https://github.com/lkurcak/ghelpr"
<<<<<<< bump-ghelpr-0.1.8
  url "https://github.com/lkurcak/ghelpr/archive/refs/tags/0.1.8.tar.gz"
  sha256 "033ab81558cbe47c0b4fd8f2981e6184ab51e13799512a0a3dcd22b532da6455"
=======
  url "https://github.com/lkurcak/ghelpr/archive/refs/tags/0.1.7.tar.gz"
  sha256 "09052eac8c27f4d0c639f98198c5cd1ddac71354d48d5369ca7b42705018bf4d"
>>>>>>> main
  license "MIT"
  head "https://github.com/lkurcak/ghelpr.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/ghelpr-0.1.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "96fe42610616a6bce327921e62538a65239db1bdf5dd42f1fd49336fd3a5ae13"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e9b2beb8bbb8ddf3378195e1de86f27592b9e38db960680183f7b0df846b0c35"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ghelpr", "--help"
  end
end
