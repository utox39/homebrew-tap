class Zigfetch < Formula
  desc "Minimal neofetch/fastfetch like system information tool"
  homepage "https://github.com/utox39/zigfetch"
  url "https://github.com/utox39/zigfetch/archive/refs/tags/v0.23.0.tar.gz"
  sha256 "ccf1e418d2005e3bfe12c15aeb7317ac3979859ef8ab564e6acd39edace17372"
  license "MIT"

  depends_on "zig" => :build

  on_linux do
    depends_on "pciutils" => :build
  end

  def install
    system "zig", "build", *std_zig_args(:safe)
  end

  test do
    system "true"
  end
end
