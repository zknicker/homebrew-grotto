class TavernRuntime < Formula
  desc "Always-on Tavern Runtime server"
  homepage "https://github.com/zknicker/tavern"
  url "https://punchpress-electron-app-209596837609-us-east-1-an.s3.us-east-1.amazonaws.com/tavern/mac/tavern-runtime-1.4.37-aarch64-apple-darwin.tar.gz"
  sha256 "4db20a6fa1293303d89ff3eb94b52de762e90dd56085d7906a20c1c08db5fedf"
  version "1.4.37"
  license :cannot_represent

  depends_on "node"

  def install
    bin.install "bin/tavern"
    bin.install "bin/tavern-runtime"
    (share/"tavern").install "share/tavern/runtime-assets"
    (share/"tavern/node_modules/@tavern").install "share/tavern/node_modules/@tavern/sdk"
    (etc/"tavern").mkpath
    (var/"log/tavern").mkpath
  end

  service do
    run [opt_bin/"tavern", "serve"]
    environment_variables TAVERN_RUNTIME_HOST: "127.0.0.1",
      TAVERN_RUNTIME_PORT: "18790",
      PATH: "#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    keep_alive true
    log_path var/"log/tavern/runtime.log"
    error_log_path var/"log/tavern/runtime.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tavern --version")
    assert_match version.to_s, shell_output("#{bin}/tavern-runtime --version")
  end
end
