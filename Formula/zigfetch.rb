class Zigfetch < Formula
  desc "Minimal neofetch/fastfetch like system information tool"
  homepage "https://github.com/utox39/zigfetch"
  url "https://github.com/utox39/zigfetch/archive/refs/tags/v0.27.0.tar.gz"
  sha256 "77b6df2cefc50c67290f6a5af139aedbe2fe82c966751e278a056f3ff70077c2"
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
