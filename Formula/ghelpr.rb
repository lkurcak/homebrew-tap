class Ghelpr < Formula
  desc "CLI tool for working with GitHub pull requests"
  homepage "https://github.com/lkurcak/ghelpr"
  url "https://github.com/lkurcak/ghelpr/archive/refs/tags/0.1.7.tar.gz"
  sha256 "09052eac8c27f4d0c639f98198c5cd1ddac71354d48d5369ca7b42705018bf4d"
  license "MIT"
  head "https://github.com/lkurcak/ghelpr.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/ghelpr-0.1.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d2beea116fe711a3cfc62931cf636a8ad667a488f22c28540df4ccdada691582"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8b6669ae0111afbbf19c072fc314cc69e99cef7ae1401909c45c6e68aea87f77"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ghelpr", "--help"
  end
end
