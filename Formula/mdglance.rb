class Mdglance < Formula
  desc "Keyboard-first Markdown and SVG previewer for terminal workflows"
  homepage "https://github.com/NepomukWolf/mdglance"
  url "https://static.crates.io/crates/mdglance/mdglance-0.2.0.crate"
  sha256 "d1f426721b6d97b266f5733b71dcd39dd2702196afe24fb15ffff9b06e66d301"
  license "MIT"
  revision 1
  head "https://github.com/NepomukWolf/mdglance.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/nepomukwolf/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f04abefa05efdf71ad6f177c35dba30dff83b8d62c357fa3ac742f0da828de3a"
  end

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdglance --version")
  end
end
