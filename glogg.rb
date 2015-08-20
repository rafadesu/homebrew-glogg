# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Glogg < Formula
  homepage "http://glogg.bonnefon.org/"
  url "http://glogg.bonnefon.org/files/glogg-1.0.2.tar.gz"
  sha1 "3072e7c2514da5294ab3fb0856c3dd877bd87b1a"

  # depends_on "cmake" => :build
  depends_on "qt5"
  depends_on "boost"

  patch do
    url "https://raw.githubusercontent.com/rafadesu/homebrew-glogg/master/glogg-1.0.2-patch.diff"
    sha1 "62f6db45557fb3b65508eb2af385e853ca15b4fd"
  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "qmake", "INCLUDEPATH=/usr/local/include", "LIBS=-L/usr/local/lib/"
    system "make", "install", "INSTALL_ROOT=/usr/local" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test glogg`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    # system "#{bin}/glogg_tests" # You can run some tests with glogg_tests but they are not installed...
    system "/usr/local/bin/glogg.app/Contents/MacOS/glogg", "-v"
  end
end
