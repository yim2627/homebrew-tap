cask "barcode" do
  version "0.2.4"
  sha256 "383d93b6877e424da92b22310cca0c0853eb4ddb2751cada5f861e75c6e9aef3"

  url "https://github.com/yim2627/BarCode/releases/download/v#{version}/BarCode.dmg"
  name "BarCode"
  desc "Minimal macOS menu bar TOTP (2FA) app"
  homepage "https://github.com/yim2627/BarCode"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "BarCode.app"

  postflight do
    # The app is ad-hoc signed (no Apple Developer ID), so macOS
    # Gatekeeper would block it on first launch. Strip the quarantine
    # attribute that brew sets so users don't have to bypass manually.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/BarCode.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.jiseong.BarCode.plist",
  ]
end
