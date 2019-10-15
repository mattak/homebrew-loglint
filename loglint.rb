class Loglint < Formula
  desc "linter by analyzing build log"
  homepage "https://github.com/mattak/loglint"
  url "https://github.com/mattak/loglint/archive/v0.1.3.tar.gz"
  sha256 "c4ab540d1c5030f2a88363df233cf440aac59b8b72f7115c248bcb5a16414b8d"

  depends_on "go" => :build
  depends_on "make" => :build
  depends_on "dep" => :build

  def install
    print buildpath
    ENV["GOPATH"] = buildpath
    loglint_path = buildpath/"src/github.com/mattak/loglint/"
    loglint_path.install buildpath.children

    cd loglint_path do
      system "dep", "ensure", "-vendor-only"
      system "go", "build"
      bin.install "loglint"
    end
  end
end
