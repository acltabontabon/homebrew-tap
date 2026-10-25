cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.17.0"
  sha256 arm:   "d5270b9d909b0ce56c9b376f0a0fe82bf45301da8261005c2e5ee580d988cf1a",
         intel: "039a57895d924a1dfe32f46a4a03d1f2fbcb9ebabaa66cc7583564f45a699d01"

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
