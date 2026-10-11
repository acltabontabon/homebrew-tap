cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.13.1"
  sha256 arm:   "8f07a730e7e30b35d1def785c276ed00a8ddd7ceda65dcadf1f631d838bb34c3",
         intel: "49a8e401577623da3d90c20ad55733c807687407243c051afa949def67de3bf7"

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
