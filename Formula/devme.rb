class Devme < Formula
  desc "The executable README — one command from git clone to running dev environment"
  homepage "https://devme.sh"
  license "MIT"
  version "0.4.0"

  on_macos do
    url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-aarch64-apple-darwin.tar.gz"
    sha256 "5383ee59944d6a568ce33676e3d85fb794f2d3f0c086202fa21ec6171a1880a3"
  end

  on_linux do
    on_arm do
      url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4b58f761ad0986e7e1c77d0d03923f31795d536b71fbb0ee5c2e852ff8f6c57"
    end

    on_intel do
      url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75ebea831c6637b484b65bf4181815d1ad4d2bf86df27e4f90c5b80f17d7c5c9"
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
