class GhContribTui < Formula
  desc "Terminal dashboard of a GitHub team's contributions"
  homepage "https://github.com/grocky/gh-contrib-tui"
  url "https://github.com/grocky/gh-contrib-tui/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6281a5eb31e9791036340db476ebdb683ee9ad829019f188dec276269e707505"
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
