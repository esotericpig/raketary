# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019-2020 Jonathan Bradley Whited (@esotericpig)
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


require 'bundler/gem_tasks'

require 'rake/clean'
require 'raketary/version'
require 'raketeer/run'
require 'yard'


task default: [:run]

CLEAN.exclude('.git/','stock/')
CLOBBER.include('doc/')


YARD::Rake::YardocTask.new() do |task|
  task.files = [File.join('lib','**','*.rb')]
  
  task.options += ['--files','CHANGELOG.md,LICENSE.txt']
  task.options += ['--readme','README.md']
  
  task.options << '--protected' # Show protected methods
  #task.options += ['--template-path',File.join('yard','templates')]
  task.options += ['--title',"Raketary v#{Raketary::VERSION} Doc"]
end
