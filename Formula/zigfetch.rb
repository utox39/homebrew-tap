class Zigfetch < Formula
  desc "Minimal neofetch/fastfetch like system information tool"
  homepage "https://github.com/utox39/zigfetch"
  url "https://github.com/utox39/zigfetch/archive/refs/tags/v0.27.2.tar.gz"
  sha256 "b60567ea9011fcafe71c0756257cda76285eb25cdefb1800e29108e93638da74"
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
