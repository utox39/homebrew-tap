class Zigfetch < Formula
  desc "Minimal neofetch/fastfetch like system information tool"
  homepage "https://github.com/utox39/zigfetch"
  url "https://github.com/utox39/zigfetch/archive/refs/tags/v0.29.0.tar.gz"
  sha256 "d111fe2b478cfb7bfe4a9ecdfe68c9efc381b1adb6947efa629463435a8f6fea"
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
