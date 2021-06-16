# encoding: UTF-8
# frozen_string_literal: true


lib = File.expand_path(File.join('..','lib'),__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'raketary/version'


Gem::Specification.new do |spec|
  spec.name        = 'raketary'
  spec.version     = Raketary::VERSION
  spec.authors     = ['Jonathan Bradley Whited']
  spec.email       = ['code@esotericpig.com']
  spec.licenses    = ['LGPL-3.0-or-later']
  spec.homepage    = 'https://github.com/esotericpig/raketary'
  spec.summary     = 'CLI app for commonly-used Rake tasks.'
  spec.description = spec.summary

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/esotericpig/raketary/issues',
    'changelog_uri'   => 'https://github.com/esotericpig/raketary/blob/master/CHANGELOG.md',
    'homepage_uri'    => 'https://github.com/esotericpig/raketary',
    'source_code_uri' => 'https://github.com/esotericpig/raketary'
  }

  spec.require_paths = ['lib']
  spec.bindir        = 'bin'
  spec.executables   = [spec.name]

  spec.files = Dir.glob(File.join("{#{spec.require_paths.join(',')}}",'**','*.{erb,rb}')) +
               Dir.glob(File.join(spec.bindir,'*')) +
               Dir.glob(File.join('{test,yard}','**','*.{erb,rb}')) +
               %W[ Gemfile Gemfile.lock #{spec.name}.gemspec Rakefile ] +
               %w[ CHANGELOG.md LICENSE.txt README.md ]

  spec.required_ruby_version = '>= 2.4'

  spec.add_runtime_dependency 'irb'       ,'~> 1.3'  # For Raketeer::IRBTask
  spec.add_runtime_dependency 'rake'      ,'~> 13.0' # For using custom Rake tasks
  spec.add_runtime_dependency 'raketeer'  ,'~> 0.2'  # For general Rake tasks
  spec.add_runtime_dependency 'yard_ghurt','~> 1.2'  # For YARDoc Rake tasks

  spec.add_development_dependency 'bundler','~> 2.2'
  spec.add_development_dependency 'yard'   ,'~> 0.9' # For documentation

  spec.post_install_message = "You can now use [#{spec.executables.join(', ')}] on the command line."
end
