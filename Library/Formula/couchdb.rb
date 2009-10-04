require 'brewkit'

class Couchdb <Formula
  @url='http://apache.multihomed.net/couchdb/0.9.1/apache-couchdb-0.9.1.tar.gz'
  @homepage='http://couchdb.apache.org/'
  @md5='9583efae5adfb3f9043e970fef825561'

  depends_on 'spidermonkey'
  depends_on 'icu4c'
  depends_on 'erlang'

  def install
    config_flags = ["--prefix=#{prefix}",
                    "--sysconfdir=#{etc}",
                    "--localstatedir=#{var}"]

    system "./configure", *config_flags
    system "make"
    system "make install"

    (var+"lib"+"couchdb").mkpath
    (var+"log"+"couchdb").mkpath
  end
end
