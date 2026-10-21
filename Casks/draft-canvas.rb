cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.15.2"
  sha256 arm:   "5f5cdf640f13ba495f1e56ecd2e51826680114ebb52ad291faf0f5c0951c5beb",
         intel: "451436facc06496f4d8365669eb551b5ac188970ed805eefc8b64d8ceb6400c6"

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
