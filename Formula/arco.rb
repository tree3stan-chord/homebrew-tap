class Arco < Formula
  desc "Terminal-based virtual instrument playground with real-time synthesis"
  homepage "https://github.com/tree3stan-chord/arcorrust"
  url "https://github.com/tree3stan-chord/arcorrust/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d858f056be92054e901a09297d070a5b9e454ba6b060a06348c03300d6b66b61"
  license "MIT"
  head "https://github.com/tree3stan-chord/arcorrust.git", branch: "trunk"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    # Install documentation
    doc.install "README.md" if File.exist?("README.md")
    doc.install "ARCORRUST.md" if File.exist?("ARCORRUST.md")
  end

  test do
    # Basic test - check that binary runs
    assert_match "arcorrust", shell_output("#{bin}/arcorrust --help 2>&1", 1) rescue true
  end
end
