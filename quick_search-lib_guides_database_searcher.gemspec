$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'quick_search/lib_guides_database_searcher/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'quick_search-lib_guides_database_searcher'
  spec.version     = QuickSearchLibGuidesDatabaseSearcher::VERSION
  spec.authors     = ['UMD Libraries']
  spec.email       = ['lib-ssdr@umd.edu']
  spec.homepage    = 'https://www.lib.umd.edu/'
  spec.summary     = 'LibGuides database searcher for NCSU QuickSearch'
  spec.description = 'LibGuides database searcher for NCSU QuickSearch.'
  spec.license     = 'Apache 2.0'

  spec.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 5.2.6'
  spec.add_dependency 'quick_search-core', '~> 0'
  spec.add_dependency 'addressable', '~> 2.7'

  spec.add_development_dependency 'rubocop', '= 0.78.0'
  spec.add_development_dependency 'rubocop-rails'
  # sqlite3 loaded for testing with the 'dummy' application
  spec.add_development_dependency 'sqlite3'
end
