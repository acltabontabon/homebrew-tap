cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.15.1"
  sha256 arm:   "bbc7c5feae860be547fbcf0a1e015261f91d3c3f82a808bfeacd6bc4b5a77a5d",
         intel: "c86251303bcaa80697d774f0efc12f240a74448d08315132662e2ee0a9abec38"

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
