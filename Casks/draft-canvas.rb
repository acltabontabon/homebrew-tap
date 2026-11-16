cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.20.0"
  sha256 arm:   "e29543d16a89381cb5b7a6d587984caa09f7c000352c7009baa31d076b510b70",
         intel: "fdc52476dc4a348c9c43c85832abbdd652526898c58ea412d77e1c13d2e1d308"

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
