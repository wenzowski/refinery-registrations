# Encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'refinery/registrations/version'

version = Refinery::Registrations::Version.to_s

Gem::Specification.new do |s|
  s.name              = 'refinerycms-registrations'
  s.version           = version
  s.summary           = 'Registrations engine for Refinery CMS'
  s.description       = 'Refinery CMS Registrations engine for campcalvarynj.com'
  s.homepage          = %q{http://campcalvarynj.com/registrations}
  s.email             = ['alexander@wenzowski.com']
  s.authors           = ['Alexander Wenzowski']

  s.executables       = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths     = %w(lib)
  s.platform          = Gem::Platform::RUBY

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',   '~> 1.0.9'
  s.add_dependency    'money'

  # Development dependencies
  # s.add_development_dependency  'refinerycms-testing'
end
