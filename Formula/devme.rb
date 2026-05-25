class Devme < Formula
  desc "The executable README — one command from git clone to running dev environment"
  homepage "https://devme.sh"
  license "MIT"
  version "0.1.0"

  on_macos do
    url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-aarch64-apple-darwin.tar.gz"
    sha256 "PLACEHOLDER"
  end

  on_linux do
    on_arm do
      url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    end

    on_intel do
      url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
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
