class Zigfetch < Formula
  desc "Minimal neofetch/fastfetch like system information tool"
  homepage "https://github.com/utox39/zigfetch"
  url "https://github.com/utox39/zigfetch/archive/refs/tags/v0.27.1.tar.gz"
  sha256 "8568efea2ec305513124978bbaf6db82b2293e9a0f8952d0d36a786bab57f90b"
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
