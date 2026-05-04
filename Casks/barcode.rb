cask "barcode" do
  version "0.2.1"
  sha256 "bdb7f87f5546ff93cf5ac647059f50a8bbf9a364d42bea93fe3d2f02b45f02ad"

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
