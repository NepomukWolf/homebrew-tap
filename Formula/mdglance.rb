class Mdglance < Formula
  desc "Keyboard-first Markdown and SVG previewer for terminal workflows"
  homepage "https://github.com/NepomukWolf/mdglance"
  url "https://static.crates.io/crates/mdglance/mdglance-0.3.0.crate"
  sha256 "4388033b5eff066b90a5cabe0c3416a3bdbcde01eae6be8ebea53d0f206f0add"
  license "MIT"
  head "https://github.com/NepomukWolf/mdglance.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/nepomukwolf/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e43ef14e528ed54a5327b9514ef0d315fc55ad1d21415829e3b5f688834d4e61"
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
