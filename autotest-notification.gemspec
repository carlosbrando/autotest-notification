# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{autotest-notification}
  s.version = "2.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Carlos Brando"]
  s.date = %q{2010-12-22}
  s.description = %q{This gem set the autotest (ZenTest) to send messages to software as Growl, LibNotify, and Snarl, displaying a window with the results.}
  s.email = ["eduardobrando@gmail.com"]
  s.executables = ["an-install", "an-uninstall", "playsound"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "autotest-notification.gemspec", "bin/an-install", "bin/an-uninstall", "bin/playsound", "images/buuf/fail.png", "images/buuf/pass.png", "images/buuf/pending.png", "images/doom/doom_0.png", "images/doom/doom_1.png", "images/doom/doom_2.png", "images/doom/doom_3.png", "images/doom/doom_4.png", "images/doom/doom_5.png", "images/doom/doom_6.png", "images/fail.png", "images/pass.png", "images/pending.png", "lib/autotest_notification.rb", "lib/autotest_notification/buuf.rb", "lib/autotest_notification/cygwin.rb", "lib/autotest_notification/doom.rb", "lib/autotest_notification/linux.rb", "lib/autotest_notification/mac.rb", "lib/autotest_notification/windows.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "sounds/doom/0.wav", "sounds/doom/1.wav", "sounds/doom/2.wav", "sounds/doom/3.wav", "sounds/doom/4.wav", "sounds/doom/5.wav", "sounds/doom/6.wav", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/autotest_notification/test_cygwin.rb", "test/autotest_notification/test_linux.rb", "test/autotest_notification/test_mac.rb", "test/autotest_notification/test_windows.rb", "test/test_autotest_notification.rb", "test/test_helper.rb", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb"]
  s.homepage = %q{http://github.com/carlosbrando/autotest-notification/}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{autotest-notification}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{This gem set the autotest (ZenTest) to send messages to software as Growl, LibNotify, and Snarl, displaying a window with the results.}
  s.test_files = ["test/autotest_notification/test_cygwin.rb", "test/autotest_notification/test_linux.rb", "test/autotest_notification/test_mac.rb", "test/autotest_notification/test_windows.rb", "test/test_autotest_notification.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<autotest-standalone>, ["~> 4.5"])
      # s.add_development_dependency(%q<rubyforge>, [">= 2.0.4"])
      # s.add_development_dependency(%q<hoe>, [">= 2.6.0"])
    else
      s.add_dependency(%q<autotest-standalone>, ["~> 4.5"])
      # s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
      # s.add_dependency(%q<hoe>, [">= 2.6.0"])
    end
  else
    s.add_dependency(%q<autotest-standalone>, ["~> 4.5"])
    # s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    # s.add_dependency(%q<hoe>, [">= 2.6.0"])
  end
end
