cask "scuttle" do
  arch arm: "apple-silicon", intel: "intel"

  version "0.2.0"
  sha256 arm:   "25aa601f26452ea63c6f8e52d859733c77185831f5eec635207796bd95c0b8ba",
         intel: "fe414845a4e51ec06b906c17a474ee824f8e033c695c106a36b652997e17e221"

  url "https://github.com/acltabontabon/scuttle/releases/download/v#{version}/Scuttle-#{version}-macos-#{arch}.dmg"
  name "Scuttle"
  desc "Find scattered files, organize them, and review cleanup with a way back"
  homepage "https://acltabontabon.com/scuttle/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Scuttle.app"

  caveats <<~EOS
    Scuttle is ad-hoc signed and not notarized by Apple. Open Scuttle once, then
    System Settings > Privacy & Security > Open Anyway if prompted.
    Homebrew preserves Gatekeeper checks. Scuttle updates itself with signed updates.
    Uninstalling this cask leaves your drawer, organization history and settings alone.
  EOS
end
