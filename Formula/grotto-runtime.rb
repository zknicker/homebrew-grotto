class GrottoRuntime < Formula
  desc "Always-on Grotto Runtime server"
  homepage "https://github.com/zknicker/grotto"
  url "https://punchpress-electron-app-209596837609-us-east-1-an.s3.us-east-1.amazonaws.com/tavern/mac/grotto-runtime-1.8.0-aarch64-apple-darwin.tar.gz"
  sha256 "7c186d29e5e519bc4d0d243e78748d14e717e212a0012a96d8cc6618554c2794"
  version "1.8.0"
  license :cannot_represent

  depends_on "node"

  def install
    bin.install "bin/grotto"
    bin.install "bin/grotto-runtime"
    (share/"grotto").install "share/grotto/runtime-assets"
    (share/"grotto").install "share/grotto/node_modules"
    (etc/"grotto").mkpath
    (var/"log/grotto").mkpath
  end

  service do
    run [opt_bin/"grotto", "serve"]
    environment_variables TAVERN_RUNTIME_HOST: "127.0.0.1",
      TAVERN_RUNTIME_PORT: "18790",
      PATH: "#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    keep_alive true
    log_path var/"log/grotto/runtime.log"
    error_log_path var/"log/grotto/runtime.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grotto --version")
    assert_match version.to_s, shell_output("#{bin}/grotto-runtime --version")
  end
end
