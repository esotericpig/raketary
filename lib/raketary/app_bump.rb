#!/usr/bin/env ruby
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


require 'raketary/cmd'
require 'raketeer/bump_task'

module Raketary
  ###
  # @author Jonathan Bradley Whited (@esotericpig)
  # @since  0.1.0
  ###
  class AppBump < Cmd
    def initialize(*)
      super
      
      @run_cmd = false
      
      parse!() do |op|
        op.on('-n','--dry-run','do a dry run (do NOT write to files)')
        op.on('-s','--strict','enforce semantic versioning (i.e., \\d+\\.\\d+\\.\\d+.*)')
        op.separator op.summary_indent
        
        op.on('-v','--ver [STR]',%q{show/set the version (e.g.: '1.2.3-alpha.4+beta.5') (default: show)}) do |ver|
          @run_cmd = true
          ver
        end
        op.on('-m','--major [INT,STR]',%q{bump/set the major number (e.g.: +2, 4) (default: +1)}) do |major|
          @run_cmd = true
          major.nil?() ? '+1' : major
        end
        op.on('-i','--minor [INT,STR]',%q{bump/set the minor number (e.g.: +2, 4) (default: +1)}) do |minor|
          @run_cmd = true
          minor.nil?() ? '+1' : minor
        end
        op.on('-p','--patch [INT,STR]',%q{bump/set the patch number (e.g.: +2, 4) (default: +1)}) do |patch|
          @run_cmd = true
          patch.nil?() ? '+1' : patch
        end
        op.on('-r','--pre [STR]',%q{set/erase the pre-release extension (e.g.: 'alpha.4') (default: erase)}) do |pre|
          @run_cmd = true
          pre.nil?() ? '' : pre
        end
        op.on('-b','--build [STR]',%q{set/erase the the build metadata (e.g.: 'beta.5') (default: erase)}) do |build|
          @run_cmd = true
          build.nil?() ? '' : build
        end
        op.on('-u','--bundle','bump the Gemfile.lock version') do
          @run_cmd = true
          true
        end
        op.separator op.summary_indent
        
        op.on_tail('-x','--example','show some examples') do
          puts <<~EOX
            #{app.name} #{@name} -v  # Show the current version
            #{app.name} #{@name} -n  # Do a dry run for any task (will NOT write to files)
            
            #{app.name} #{@name} -v '1.2.3-alpha.4-beta.5'  # Set the version manually
            #{app.name} #{@name} -m 1 -i 2 -p 3             # Set the version numbers
            #{app.name} #{@name} -r 'alpha.4' -b 'beta.5'   # Set the version extensions
            #{app.name} #{@name} -m -i -p                   # Bump the version numbers by 1
            #{app.name} #{@name} -m +2 -i +3 -p +4          # Bump the version numbers by X
            
            #{app.name} #{@name} -m            # Bump the major number by 1
            #{app.name} #{@name} -m 1          # Set the major number to 1
            #{app.name} #{@name} -m +2         # Bump the major number by 2
            #{app.name} #{@name} -i            # Bump the minor number by 1
            #{app.name} #{@name} -i 2          # Set the minor number to 2
            #{app.name} #{@name} -i +3         # Bump the minor number by 3
            #{app.name} #{@name} -p            # Bump the patch number by 1
            #{app.name} #{@name} -p 3          # Set the patch number to 3
            #{app.name} #{@name} -p +4         # Bump the patch number by 4
            #{app.name} #{@name} -r            # Erase the pre-release extension
            #{app.name} #{@name} -r 'alpha.4'  # Set the pre-release extension
            #{app.name} #{@name} -b            # Erase the build metadata
            #{app.name} #{@name} -b 'beta.5'   # Set the build metadata
            #{app.name} #{@name} -u            # Bump the Gemfile.lock version
          EOX
          exit
        end
      end
    end
    
    def run()
      super()
      return unless @run_cmd
      
      bump_task = Raketeer::BumpTask.new()
      bump_task.bump_bundle = false
      bump_task.dry_run = app.options[:dry_run] ? true : false
      bump_task.strict = app.options[:strict] ? true : false
      
      bump_task.check_env()
      
      bump_task.bump_bundle_file() if app.options[:bundle]
      
      bump_task.bump_all(Raketeer::BumpVer.new(
        version: app.options[:ver],
        major: app.options[:major],
        minor: app.options[:minor],
        patch: app.options[:patch],
        prerelease: app.options[:pre],
        build_meta: app.options[:build]
      ))
      
      app.ran_cmd = true
    end
  end
end
