class TLang < Formula
  desc "Small no-GC language built one type-theory concept at a time"
  homepage "https://github.com/lkurcak/t-lang"
  url "https://github.com/lkurcak/t-lang/archive/refs/tags/v0.47.0.tar.gz"
  sha256 "e50886bcf02372537447fa7cb0edaf032066c0a09134e7e368d1091f22c41bfb"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lkurcak/t-lang.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/lkurcak/homebrew-tap/releases/download/t-lang-0.46.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ab973af4dc0e4ef907fc9e16904c66f116c7c642fb64a05b4ab238a97d345102"
    sha256                               x86_64_linux: "0350ba294ab2631a4bb22b69b7c39b3c46af49ff5cc2fa06bcfad77c007aa388"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    # The test's program is t-lang's own, so its tests keep it working.
    pkgshare.install "examples/brew.t"
  end

  test do
    assert_equal "3628800\n", shell_output("#{bin}/t run #{pkgshare}/brew.t")
  end
end
