Gem::Specification.new do |s|
  s.name = %q{autotest-notification}
  s.version = "1.4.0"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Carlos Brando", "Rodrigo Urubatan", "Alexandre da Silva", "Carlos J\303\272nior", "Davis Zanetti Cabral", "Marcos Tapaj\303\263s", "Thiago Pradi", "Oz\303\251ias Sant'ana"]
  s.date = %q{2008-06-18}
  s.description = %q{This gem set the autotest (ZenTest) to send messages to software as Growl, LibNotify, and Snarl, displaying a window with the results.}
  s.email = ["eduardobrando@gmail.com"]
  s.executables = ["an-install", "an-uninstall", "playsound"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/autotest_notification.rb", "lib/autotest_notification/version.rb", "lib/autotest_notification/linux.rb", "lib/autotest_notification/windows.rb", "lib/autotest_notification/cygwin.rb", "lib/autotest_notification/mac.rb", "lib/autotest_notification/doom.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/test_autotest_notification.rb", "test/test_helper.rb", "test/autotest_notification/test_cygwin.rb", "test/autotest_notification/test_linux.rb", "test/autotest_notification/test_windows.rb", "test/autotest_notification/test_mac.rb", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb", "bin/an-install", "bin/an-uninstall", "bin/playsound", "images/pass.png", "images/fail.png", "autotest-notification.gemspec", "images/doom/doom_0.png", "images/doom/doom_1.png", "images/doom/doom_2.png", "images/doom/doom_3.png", "images/doom/doom_4.png", "images/doom/doom_5.png", "images/doom/doom_6.png", "sounds/doom/0.wav", "sounds/doom/1.wav", "sounds/doom/2.wav", "sounds/doom/3.wav", "sounds/doom/4.wav", "sounds/doom/5.wav", "sounds/doom/6.wav"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/carlosbrando/autotest-notification/}
  s.post_install_message = %q{
For more information on autotest_notification, see http://github.com/carlosbrando/autotest-notification/

To turn on the notifier you need to run the following command:
  an-install

To turn off:
  an-uninstall

}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{autotest-notification}
  s.rubygems_version = %q{1.1.1}
  s.summary = %q{This gem set the autotest (ZenTest) to send messages to software as Growl, LibNotify, and Snarl, displaying a window with the results.}
  s.test_files = ["test/autotest_notification/test_cygwin.rb", "test/autotest_notification/test_linux.rb", "test/autotest_notification/test_mac.rb", "test/autotest_notification/test_windows.rb", "test/test_autotest_notification.rb", "test/test_helper.rb"]

  s.add_dependency(%q<ZenTest>, [">= 3.9.2"])
end
