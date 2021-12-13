class Loglint < Formula
  desc "linter by analyzing build log"
  homepage "https://github.com/mattak/loglint"
  url "https://github.com/mattak/loglint/archive/v0.1.4.tar.gz"
  sha256 "ae8faf6fdd8924da2cd80d14cae77aa8e0ec0841ad256574432dada8d1ddca27"

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
