cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.21.0"
  sha256 arm:   "1ac3bcbe57cfbf203440c57e43b6c2af1b402a762b43c585976e3d8a0da30273",
         intel: "267ac47724ce97a6aa5124d2000b0a4848814d6988b64f3eecb9b248fc7e2a24"

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
