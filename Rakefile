begin
  require 'spec/rake/spectask'
  require 'rake/rdoctask'
rescue LoadError
  puts <<-EOS
  Missing development dependencies:
    gem install rspec factory_girl sqlite3-ruby activerecord
  EOS
  exit 1
end

desc 'Default: run unit tests.'
task :default => :spec

desc 'Test the associated with plugin.'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.libs << 'lib'
  t.verbose = true
end


desc 'Generate documentation for the associated_with plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'AssociatedWith'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


 
