#!/usr/bin/env ruby
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

require 'rake'
require 'raketary/cmd'
require 'raketeer/github_pkg_task'


module Raketary
  ###
  # @author Jonathan Bradley Whited (@esotericpig)
  # @since  0.1.2
  ###
  class AppGitHubPkg < Cmd
    def initialize(*)
      super
      
      parse!() do |op|
        op.on('-u','--user [STR]','set the GitHub username')
      end
    end
    
    def run()
      super()
      
      ghpkg_task = Raketeer::GitHubPkgTask.new() do |task|
        task.username = app.options[:user]
      end
      
      ghpkg_task = Rake::Task[ghpkg_task.name]
      
      ghpkg_task.reenable()
      ghpkg_task.invoke()
      
      app.ran_cmd = true
    end
  end
end
