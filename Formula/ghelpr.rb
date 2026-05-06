class Ghelpr < Formula
  desc "CLI tool for working with GitHub pull requests"
  homepage "https://github.com/lkurcak/ghelpr"
  url "https://github.com/lkurcak/ghelpr/archive/refs/tags/0.1.4.tar.gz"
  sha256 "cd377876a8f68df75d4b3f72851ee8dd9ae628331d5fad3aedd017f782630115"
  license "MIT"
  head "https://github.com/lkurcak/ghelpr.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/ghelpr-0.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f8dc0a593700ed1f4f7cbaea68e1f2e1c94e647856f592def5e1e802edc4aad9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0744bb61ee259eb02b71115e415711b01bec0d78fad12eaea0bf6e3408536dc2"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ghelpr", "--help"
  end
end
