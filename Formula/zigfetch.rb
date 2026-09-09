class Zigfetch < Formula
  desc "Minimal neofetch/fastfetch like system information tool"
  homepage "https://github.com/utox39/zigfetch"
  url "https://github.com/utox39/zigfetch/archive/refs/tags/v0.30.0.tar.gz"
  sha256 "84da4559072d3c6f37c5875b56359e37c098a8cc7972c9b0bb5d40b7761f5026"
  license "MIT"

  depends_on "zig" => :build

  on_linux do
    depends_on "pciutils" => :build
  end

  def install
    args = std_zig_args(release_mode: :safe)

    if ENV["ZIGFETCH_ENABLE_RPM"]
      odie "ZIGFETCH_ENABLE_RPM is only supported on Linux" unless OS.linux?
      args << "-Denable-rpm"
    end

    system "zig", "build", *args
  end

  test do
    assert_path_exists bin/"zigfetch"
  end
end
