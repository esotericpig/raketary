# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019 Jonathan Bradley Whited (@esotericpig)
# 
# Raketary is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# Raketary is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public License
# along with Raketary.  If not, see <https://www.gnu.org/licenses/>.
#++


lib = File.expand_path(File.join('..','lib'),__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'raketary/version'

Gem::Specification.new() do |spec|
  spec.name        = 'raketary'
  spec.version     = Raketary::VERSION
  spec.authors     = ['Jonathan Bradley Whited (@esotericpig)']
  spec.email       = ['bradley@esotericpig.com']
  spec.licenses    = ['LGPL-3.0-or-later']
  spec.homepage    = 'https://github.com/esotericpig/raketary'
  spec.summary     = 'CLI for Raketeer.'
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
               Dir.glob(File.join(spec.bindir,'**',"{#{spec.executables.join(',')}}")) +
               Dir.glob(File.join('{test,yard}','**','*.{erb,rb}')) +
               %W( Gemfile Gemfile.lock #{spec.name}.gemspec Rakefile ) +
               %w( CHANGELOG.md LICENSE.txt README.md )
  
  spec.post_install_message = "You can now use [#{spec.executables.join(', ')}] on the command line."
  
  spec.required_ruby_version = '>= 2.4.6'
  
  spec.add_runtime_dependency 'irb'     ,'~> 1.0'  # For Raketeer::IRBTask
  spec.add_runtime_dependency 'rake'    ,'~> 12.3' # For Raketeer
  spec.add_runtime_dependency 'raketeer','~> 0.2'
  
  spec.add_development_dependency 'bundler','~> 2.0'
end
