class OpensslAT11 < Formula
  desc "Cryptography and SSL/TLS Toolkit"
  homepage "https://www.openssl.org/"
  url "https://www.openssl.org/source/openssl-1.1.1w.tar.gz"
  sha256 "cf3098950cb4d853ad95c0841f1f9c6d3dc102dccfcacd521d93925208b76ac8"
  license "OpenSSL"

  keg_only :versioned_formula

  def install
    system "./config", "--prefix=#{prefix}",
                       "--openssldir=#{etc}/openssl@1.1",
                       "no-ssl3",
                       "no-ssl3-method",
                       "no-zlib"
    system "make"
    system "make", "install_sw"
  end

  test do
    assert_match "OpenSSL 1.1.1", shell_output("#{bin}/openssl version")
  end
end
