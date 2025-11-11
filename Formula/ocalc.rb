class Ocalc < Formula
  desc "Simple calculator implemented in OCaml"
  homepage "https://github.com/lkurcak/ocalc"
  url "https://github.com/lkurcak/ocalc/archive/refs/tags/0.1.0.tar.gz"
  sha256 "d38f01fdfdd943b9749cdd0f27761a83d5e218816e36459f8cefd47fecb806e3"
  license "Unlicense"
  head "https://github.com/lkurcak/ocalc.git", branch: "main"

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
