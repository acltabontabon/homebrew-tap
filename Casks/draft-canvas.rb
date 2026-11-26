cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.22.0"
  sha256 arm:   "e1098621d3a87ac4a4fefb834e429b7f940523c839eb95867a6f66acc482e8e7",
         intel: "da84967965995e1dea0ff34dda76a073bcec3247f2900813e09d6139be1a81dd"

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
