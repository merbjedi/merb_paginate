require 'rubygems'
require 'rake/gempackagetask'

require 'merb-core'
require 'merb-core/tasks/merb'

load 'spec/tasks.rake'

desc 'Default: run specs.'
task :default => :spec

GEM_NAME = "merb_paginate"
GEM_VERSION = "0.9.0"
AUTHORS = ['Jacques Crocker', 'Mislav Marohnić', 'PJ Hyett']
EMAIL = 'merbjedi@gmail.com'
HOMEPAGE = 'http://github.com/merbjedi/merb_paginate'
SUMMARY = "merb_paginate is a fork of will_paginate agnostic branch, refocused to work specifically with Merb"

spec = Gem::Specification.new do |s|
  s.rubyforge_project = 'merb'
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.summary = SUMMARY
  s.description = s.summary
  s.authors = AUTHORS
  s.email = EMAIL
  s.homepage = HOMEPAGE
  
  s.add_dependency('merb-core', '>= 1.0')

  s.require_path = 'lib'
  s.files = %w(LICENSE README.rdoc CHANGELOG.rdoc Rakefile) + Dir.glob("{lib,spec}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the plugin as a gem"
task :install do
  Merb::RakeHelper.install(GEM_NAME, :version => GEM_VERSION)
end

desc "Uninstall the gem"
task :uninstall do
  Merb::RakeHelper.uninstall(GEM_NAME, :version => GEM_VERSION)
end

desc "Create a gemspec file"
task :gemspec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

require 'lib/merbtasks'