cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.16.1"
  sha256 arm:   "ce8493d743a38b779b4c43cf019a4eb163c963201a3d78107ea4e570b46a8a71",
         intel: "eda389422f7eb922f2422617d3908944af35b2b4f15ca8dee8a9b89993d6bcb0"

  url "https://github.com/acltabontabon/draft-canvas/releases/download/v#{version}/Draft-Canvas_#{version}_macOS_#{arch}.dmg"
  name "Draft Canvas"
  desc "Draw software architecture and explain how it works"
  homepage "https://draftcanvas.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Draft Canvas.app"

  caveats <<~EOS
    For builds without Apple signing and notarization, open Draft Canvas once, then
    System Settings > Privacy & Security > Open Anyway if prompted.
    Homebrew preserves Gatekeeper checks. Draft Canvas updates itself with signed updates.
    Uninstalling this cask leaves your diagrams, Quick Drafts and recovery data alone.
  EOS
end
