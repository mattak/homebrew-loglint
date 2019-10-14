class Loglint < Formula
  desc "linter by analyzing build log"
  homepage "https://github.com/mattak/loglint"
  url "https://github.com/mattak/loglint/archive/v0.1.1.tar.gz"
  sha256 "dd8be0cb32ec1247f1c50f5e9f4526267bd6cb0d73ecdc06d167b00c0a24a553"

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    print buildpath
    ENV["GOPATH"] = buildpath
    loglint_path = buildpath/"src/github.com/mattak/loglint/"
    loglint_path.install buildpath.children

    cd loglint_path do
      system "make"
    end
  end

  test do
    system "make", "test"
  end
end
