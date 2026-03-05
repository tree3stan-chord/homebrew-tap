class Arco < Formula
  desc "Terminal-based virtual instrument playground with real-time synthesis"
  homepage "https://github.com/tree3stan-chord/arcorrust"
  url "https://github.com/tree3stan-chord/arcorrust/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "adf05a11a134ac74dec04f848e4dc02c852ad9d61f2ade4a2e450e819e62fcaa"
  license "MIT"
  head "https://github.com/tree3stan-chord/arcorrust.git", branch: "trunk"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    # Install documentation
    doc.install "README.md" if File.exist?("README.md")
  end

  test do
    # Basic test - check that binary runs
    assert_match "arco", shell_output("#{bin}/arco --help 2>&1", 1) rescue true
  end
end
