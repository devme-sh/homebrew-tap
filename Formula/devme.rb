class Devme < Formula
  desc "The executable README — one command from git clone to running dev environment"
  homepage "https://devme.sh"
  license "MIT"
  version "0.4.1"

  on_macos do
    url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-aarch64-apple-darwin.tar.gz"
    sha256 "1d26eec165b6be4f7b9a43d50c93a195863ce39b887db66a628b4d32c15087df"
  end

  on_linux do
    on_arm do
      url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4df1c7e0a8c18ccea093ac8536da0b83e73aaa0719e0218d440646e81ee82b0"
    end

    on_intel do
      url "https://github.com/devme-sh/devme/releases/download/v#{version}/devme-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3a69268211ad8bcf3b6fdc7743b047f0d3082ded2cdd3a63d7173aa406ee950"
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
