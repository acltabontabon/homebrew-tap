cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.22.1"
  sha256 arm:   "5df7b051737a95f883c9a2b2752897718bfd5a71f8ecfc8ac5218f7718400d1b",
         intel: "2350729a5dfde39f2dcbe85e9e678dc88874a194bdbaf545bc67da06702d4b63"

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
