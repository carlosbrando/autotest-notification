Gem::Specification.new do |s|
  s.name = "carlosbrando"
  s.version = "0.0.1"
  s.date = "2008-05-11"
  s.summary = "Set the autotest to display messages through software such as Growl"
  s.email = "eduardobrando@gmail.com"
  s.homepage = "http://github.com/carlosbrando/autotest-notification"
  s.description = "Set the autotest to display messages through software such as Growl. Currently works for Mac (growlnotify) and Linux (notify-send)."
  s.has_rdoc = true
  s.authors = ["Carlos Brando"]
  s.files = [
    "autotest_notification.gemspec", 
    "History.txt", 
    "License.txt",
    "Manifest.txt", 
    "PostInstall.txt",
    "README.txt", 
    "Rakefile", 
    "bin/an-install",
    "images/fail.png",
    "images/pass.png",
    "lib/autotest_notification.rb", 
    "lib/autotest_notification/version.rb"
  ]
  s.test_files = ["test/test_autotest_notification.rb", "test/test_helper.rb"]
  s.rdoc_options = ["--main", "README.txt"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.add_dependency("mime-types", ["> 0.0.0"])
end