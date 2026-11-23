cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.21.1"
  sha256 arm:   "37d4dbf740d3f14efad7968e71a2de38d97a02a0e41ecd484a6a4426f4a50ea7",
         intel: "fd773b1d175bd5714ee096825c12a937dcf6795fd1f8102a117fcb72e6a97f21"

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
