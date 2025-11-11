class Ocalc < Formula
  desc "Simple calculator implemented in OCaml"
  homepage "https://github.com/lkurcak/ocalc"
  url "https://github.com/lkurcak/ocalc/archive/refs/tags/0.1.0.tar.gz"
  sha256 "d38f01fdfdd943b9749cdd0f27761a83d5e218816e36459f8cefd47fecb806e3"
  license "Unlicense"
  head "https://github.com/lkurcak/ocalc.git", branch: "main"

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/ocalc-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "82038433f188c40d533757ca3299d703ea0cb93a686e3ed9001c87c3f580555d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f9d8b6f6544a1b81b79cbe44b0246ed69a044c098cf4b88cba9dac5160c55548"
  end

  depends_on "dune" => :build
  depends_on "ocaml"

  def install
    system "dune", "build", "--profile=release"
    bin.install "_build/default/bin/main.exe" => "ocalc"
  end

  test do
    assert_equal "5", shell_output("#{bin}/ocalc '2 + 3'").strip
  end
end
