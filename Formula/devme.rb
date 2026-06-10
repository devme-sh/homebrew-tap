class Devme < Formula
  desc "The executable README — one command from git clone to running dev environment"
  homepage "https://devme.sh"
  license "MIT"
  version "0.3.0"

  on_macos do
    url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-aarch64-apple-darwin.tar.gz"
    sha256 "00fb0359e63a862cae0c985631989a0a585a87fcf3f3d2e81753c730af032375"
  end

  on_linux do
    on_arm do
      url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa5c2cf1b24f459972bb26b49ed3792ab971436982fdfbac8f0b5da474d5f8d2"
    end

    on_intel do
      url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9d4d45fd67466208b8222230090bccc349f1843a24c7ec779a82d52e5168e5c"
    end
  end

  def install
    bin.install "devme"
    bin.install "devme-tui" if File.exist?("devme-tui")
    bin.install "devme-supervisor" if File.exist?("devme-supervisor")
    bin.install "devme-shared-supervisor" if File.exist?("devme-shared-supervisor")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devme --version")
  end
end
