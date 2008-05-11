Gem::Specification.new do |s|
  s.name = "autotest-notification"
  s.version = "0.0.2"
  s.date = "2008-05-11"
  s.summary = "Set the autotest to display messages through software such as Growl"
  s.email = "eduardobrando@gmail.com"
  s.homepage = "http://github.com/carlosbrando/autotest-notification"
  s.description = "Set the autotest to display messages through software such as Growl"
  s.has_rdoc = true
  s.authors = ["Carlos Brando"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/autotest_notification.rb", "lib/autotest_notification/version.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/test_autotest_notification.rb", "test/test_helper.rb", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb", "bin/an-install", "images/pass.png", "images/fail.png", "autotest-notification.gemspec"]
  s.test_files = ["test/test_autotest_notification.rb", "test/test_helper.rb"]
  s.rdoc_options = ["--main", "README.txt"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "website/index.txt"]


  
  # s.specification_version = 2 if s.respond_to? :specification_version=

  # s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=


  # s.default_executable = %q{an-install}
  # s.executables = ["an-install"]

#   s.post_install_message = %q{
# For more information on autotest_notification, see http://autotest_notification.rubyforge.org
# 
# NOTE: Change this information in PostInstall.txt 
# You can also delete it if you don't want it.
# 
# 
# }

  # s.require_paths = ["lib"]
  # s.rubyforge_project = %q{autotestnotific}
  # s.rubygems_version = %q{1.1.1}
end
