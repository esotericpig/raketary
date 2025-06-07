# encoding: UTF-8
# frozen_string_literal: true

require_relative 'lib/raketary/version'

Gem::Specification.new do |spec|
  spec.name        = 'raketary'
  spec.version     = Raketary::VERSION
  spec.authors     = ['Bradley Whited']
  spec.email       = ['code@esotericpig.com']
  spec.licenses    = ['LGPL-3.0-or-later']
  spec.homepage    = 'https://github.com/esotericpig/raketary'
  spec.summary     = 'CLI app for commonly-used Rake tasks.'
  spec.description = spec.summary

  spec.metadata = {
    'rubygems_mfa_required' => 'true',
    'homepage_uri'          => spec.homepage,
    'changelog_uri'         => 'https://github.com/esotericpig/raketary/blob/main/CHANGELOG.md',
    'source_code_uri'       => 'https://github.com/esotericpig/raketary',
    'bug_tracker_uri'       => 'https://github.com/esotericpig/raketary/issues',
  }

  spec.required_ruby_version = '>= 2.4'
  spec.require_paths         = ['lib']
  spec.bindir                = 'bin'
  spec.executables           = [spec.name]

  spec.files = [
    Dir.glob("{#{spec.require_paths.join(',')}}/**/*.{erb,rb}"),
    Dir.glob("#{spec.bindir}/*"),
    Dir.glob('{spec,test,yard}/**/*.{erb,rb}'),
    %W[Gemfile Gemfile.lock #{spec.name}.gemspec Rakefile],
    %w[CHANGELOG.md LICENSE.txt README.md],
  ].flatten

  spec.add_dependency 'rake'      ,'~> 13.3' # For using the Rake tasks.

  # For the general Rake tasks.
  spec.add_dependency 'raketeer'  ,'~> 0.2'
  spec.add_dependency 'irb'       ,'~> 1.15' # For Raketeer::IRBTask.

  # For the YARDoc Rake tasks.
  spec.add_dependency 'yard_ghurt','~> 1.2'
  spec.add_dependency 'yard'      ,'~> 0.9'

  spec.post_install_message = "=> You can now use `#{spec.name}` on the command line."
end
