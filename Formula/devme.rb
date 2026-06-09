class Devme < Formula
  desc "The executable README — one command from git clone to running dev environment"
  homepage "https://devme.sh"
  license "MIT"
  version "0.2.0"

  on_macos do
    url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-aarch64-apple-darwin.tar.gz"
    sha256 "e44c9ece8f7de4e3fcf9ee0d9b2b310d163011bda81b39c16319cdcfe8cf13ee"
  end

  on_linux do
    on_arm do
      url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd600142eeb1a74af3c26d14b195d4b1de279d2a06f1fecf2fa465e63db46383"
    end

    on_intel do
      url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "858513401d6788367dbb5f53fec6fde0694e29bee01487f0e3cb9bfabb951fb3"
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
