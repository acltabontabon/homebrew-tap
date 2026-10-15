cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.14.0"
  sha256 arm:   "08e07e20dfcc5f77e53d82aa4e968e68cc6f5171bfefcf80f46988e3fe36ad9d",
         intel: "2e18da7bdcd05a26bf7016bfb5dcf0ea4dd71ef7c3f8c9b25ef342fb9e1ba0cf"

  url "https://github.com/acltabontabon/draft-canvas/releases/download/v#{version}/Draft-Canvas_#{version}_macOS_#{arch}.dmg"
  name "Draft Canvas"
  desc "Draw software architecture and explain how it works"
  homepage "https://acltabontabon.com/draft-canvas/"

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
