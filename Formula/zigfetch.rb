class Zigfetch < Formula
  desc "Minimal neofetch/fastfetch like system information tool"
  homepage "https://github.com/utox39/zigfetch"
  url "https://github.com/utox39/zigfetch/archive/refs/tags/v0.32.0.tar.gz"
  sha256 "d70c964fbfa08bf1e777e0ccf7b689142a2e2d96830a770f8c4281538b1ca713"
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
