cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.19.0"
  sha256 arm:   "ada6fb233ee82b132c8fafd9221c23d81517739f916bc5757397aff9120ce9b2",
         intel: "0b63600c913e7c6db71c57b3af70072bf8f4cd3672d61c46cf2a4ab163ab9b2a"

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
