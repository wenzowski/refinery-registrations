Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-registrations'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Registrations engine for Refinery CMS'
  s.date              = '2012-02-17'
  s.summary           = 'Registrations engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']

  s.add_dependency 'money'
end
