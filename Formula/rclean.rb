# typed: false
# frozen_string_literal: true

# Binary formula for rclean (package rclean-cli). Version, URLs, and
# sha256 values are rewritten automatically by the release workflow in
# majiayu000/rclean on every tagged release; edit that workflow, not
# the placeholders here.
class Rclean < Formula
  desc "Find and safely clean rebuildable developer artifacts"
  homepage "https://github.com/majiayu000/rclean"
  version "0.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/majiayu000/rclean/releases/download/v#{version}/rclean-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_SHA256_AARCH64_APPLE_DARWIN"
    else
      url "https://github.com/majiayu000/rclean/releases/download/v#{version}/rclean-cli-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_SHA256_X86_64_APPLE_DARWIN"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/majiayu000/rclean/releases/download/v#{version}/rclean-cli-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_SHA256_AARCH64_UNKNOWN_LINUX_GNU"
    else
      url "https://github.com/majiayu000/rclean/releases/download/v#{version}/rclean-cli-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_SHA256_X86_64_UNKNOWN_LINUX_GNU"
    end
  end

  def install
    bin.install "rclean"
    generate_completions_from_executable(bin/"rclean", "completions")
    (buildpath/"rclean.1").write Utils.safe_popen_read(bin/"rclean", "man")
    man1.install "rclean.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rclean --version")
  end
end
