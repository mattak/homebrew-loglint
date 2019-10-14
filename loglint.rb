class Loglint < Formula
  desc "linter by analyzing build log"
  homepage "https://github.com/mattak/loglint"
  url "https://github.com/mattak/loglint/archive/v0.1.0.tar.gz"
  sha256 "e582e837948ae2f2a9f20d487acd88d4e4b01a50281c1789d93bda26cfad3477"

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
