require 'spec/rake/spectask'

spec_opts = 'spec/spec.opts'

desc 'Run framework-agnostic specs'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.libs << 'lib' << 'spec'
  t.spec_opts = ['--options', spec_opts]
  t.spec_files = FileList.new('spec/**/*_spec.rb')
end