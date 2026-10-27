cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.18.0"
  sha256 arm:   "a4f2834946bdadf9cc83e107d53595172b4dd7ae4eca3860e3085ee09d75c9e8",
         intel: "0be1c6910063a24c5d2e52819661a59e507cc505c4c2df0b1d1f5a999217100e"

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
