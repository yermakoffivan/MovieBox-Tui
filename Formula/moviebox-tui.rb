class MovieboxTui < Formula
  VERSION = "0.1.24"
  MACOS_SHA256 = "62a6bd2fca81b866c497054aec56d40ea02693d7784c919a7d4230b3d4ecd011"
  LINUX_X64_SHA256 = "7cc04c443c4209a330dfd5289f99113d018b1e98532b7e4b0d104e304e2e9dd4"
  LINUX_ARM64_SHA256 = "eb4e20c4fff2ca71b32eed3fd140272327d720238ab773f95631d7b794eedc7a"

  desc "Stream movies, shows, anime, and live TV from your terminal"
  homepage "https://github.com/mesamirh/MovieBox-Tui"
  version VERSION
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_macOS_Universal.tar.gz"
    sha256 MACOS_SHA256
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_arm64.tar.gz"
      sha256 LINUX_ARM64_SHA256
    else
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_x64.tar.gz"
      sha256 LINUX_X64_SHA256
    end
  end

  def install
    bin.install "moviebox-tui"
  end

  test do
    system "#{bin}/moviebox-tui", "--version"
  end
end
