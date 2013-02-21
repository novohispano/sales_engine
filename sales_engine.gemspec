lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bundler/version'

Gem::Specification.new do |gem|
  gem.name        = 'sales_engine'
  gem.version     = '0.0.1'
  gem.summary     = "Sales Engine"
  gem.description = "Sales Engine"
  gem.authors     = ["Jorge Teliez", "Ron Rateau"]
  gem.email       = 'novohispano@gmail.com'
  gem.files         = Dir["{data, lib}/**/*"] + %w(
                        sales_engine.gemspec
                      )
  gem.homepage    = 'https://github.com/novohispano/sales_engine'
  gem.required_ruby_version  = '>=1.9'
end