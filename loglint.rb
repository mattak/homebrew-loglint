class Loglint < Formula
  desc "linter by analyzing build log"
  homepage "https://github.com/mattak/loglint"
  url "https://github.com/mattak/loglint/archive/v0.1.2.tar.gz"
  sha256 "6ffc7ea140394b17032e669ea4698c9ccd90b25a1264e37e82328e1f7beb5caf"

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
