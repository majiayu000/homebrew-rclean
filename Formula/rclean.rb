# typed: false
# frozen_string_literal: true

# Rendered by .github/workflows/release.yml on every tagged release and
# pushed to majiayu000/homebrew-rclean. Edit the template in the rclean
# repo, not the generated formula in the tap.
class Rclean < Formula
  desc "Find and safely clean rebuildable developer artifacts"
  homepage "https://github.com/majiayu000/rclean"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/majiayu000/rclean/releases/download/v#{version}/rclean-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "de4f8496fa5b0242101f4181231a6f5646108e1c1abe6db414f0b269c6a4120c"
    else
      url "https://github.com/majiayu000/rclean/releases/download/v#{version}/rclean-cli-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3617306de72c63c4219dd9a519429f5894788cb9391ea303beca977ad2160b5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/majiayu000/rclean/releases/download/v#{version}/rclean-cli-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d74035fe9b0a3b815f64c68ebd0870ad06e83a631f7ed28f03aab02e6cbe0842"
    else
      url "https://github.com/majiayu000/rclean/releases/download/v#{version}/rclean-cli-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76b907bae12e79cf486f288405ca3c2c503200a0ca5cb52f029ae67feb2c90b5"
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
