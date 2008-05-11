Gem::Specification.new do |s|
  s.name = %q{autotest-notification}
  s.version = "0.0.3"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Carlos Brando"]
  s.date = %q{2008-05-11}
  s.default_executable = %q{an-install}
  s.description = %q{Set the autotest to display messages through software such as Growl}
  s.email = ["eduardobrando@gmail.com"]
  s.executables = ["an-install"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/autotest_notification.rb", "lib/autotest_notification/version.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/test_autotest_notification.rb", "test/test_helper.rb", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb", "bin/an-install", "images/pass.png", "images/fail.png", "autotest-notification.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://autotestnotific.rubyforge.org}
  s.post_install_message = %q{
For more information on autotest_notification, see http://autotest_notification.rubyforge.org

NOTE: Change this information in PostInstall.txt 
You can also delete it if you don't want it.


}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.1.1}
  s.summary = %q{Set the autotest to display messages through software such as Growl}
  s.test_files = ["test/test_autotest_notification.rb", "test/test_helper.rb"]
end
