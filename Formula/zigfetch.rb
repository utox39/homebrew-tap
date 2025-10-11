class Zigfetch < Formula
  desc "Minimal neofetch/fastfetch like system information tool"
  homepage "https://github.com/utox39/zigfetch"
  url "https://github.com/utox39/zigfetch/archive/refs/tags/v0.24.0.tar.gz"
  sha256 "32df75a27188c626602610550bb945a3d2a09e9025b116dec213500ab779c109"
  license "MIT"

  depends_on "zig" => :build

  on_linux do
    depends_on "pciutils" => :build
  end

  def install
    system "zig", "build", *std_zig_args(release_mode: :safe)
  end

  test do
    assert_path_exists bin/"zigfetch"
  end
end
