cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.15.0"
  sha256 arm:   "fcda9a2ec5d53e0e30ce3556e34afbd4dfd37fdf86366eebfc15db03cf6015d1",
         intel: "b87d8a5f376cceb94f9abef9bd1f50292b38f3ea9f468f7a2d7d622a3bca22f0"

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
