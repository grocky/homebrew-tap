class GhContribTui < Formula
  desc "Terminal dashboard of a GitHub team's contributions"
  homepage "https://github.com/grocky/gh-contrib-tui"
  url "https://github.com/grocky/gh-contrib-tui/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6a2677a5d4bf41cfc12d2dd84c9d5228e59bff4812195fabc0650ae4c020b40d"
  license "MIT"
  head "https://github.com/grocky/gh-contrib-tui.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-X main.buildVersion=v#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/gh-contrib-tui"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/gh-contrib-tui --version")
  end
end
