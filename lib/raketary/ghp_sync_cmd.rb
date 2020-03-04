#!/usr/bin/env ruby
# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2020 Jonathan Bradley Whited (@esotericpig)
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


require 'rake'
require 'shellwords'
require 'yard_ghurt/ghp_sync_task'


module Raketary
  ###
  # @author Jonathan Bradley Whited (@esotericpig)
  # @since  0.2.0
  ###
  class GHPSyncCmd < Cmd
    def initialize(*)
      super
      
      # Kind of hacky, but necessary because sync_args can have a hyphen/dash.
      app.args.each_with_index() do |arg,i|
        arg = arg.strip()
        
        if arg == '-s' || arg.downcase() == '--sync-args'
          sync_args = app.args[i + 1] # If out of bounds, nil
          
          if !sync_args.nil?()
            sync_args = Shellwords.split(sync_args)
            sync_args = nil if sync_args.nil?() || sync_args.empty?()
            
            app.options[:sync_args] = sync_args
          end
          
          app.args.delete_at(i)
          app.args.delete_at(i) # If out of bounds, no error
          
          break
        end
      end
      
      parse!() do |op|
        op.on('-g','--ghp-dir STR','the destination (GitHub Pages) directory to sync "doc/" to')
        
        op.separator op.summary_indent
        
        op.on('-d','--deploy',"actually deploy (don't just do a dry-run)")
        op.on('-s','--sync-args STR','additional args to pass to the sync command') do |sync_args|
          app.options[:sync_args] # Already processed above
        end
        
        op.separator op.summary_indent
      end
    end
    
    def run()
      super()
      
      ghp_dir = app.options[:ghp_dir]
      
      return unless ghp_dir
      
      deploy = app.options[:deploy]
      sync_args = app.options[:sync_args]
      
      sync_task = YardGhurt::GHPSyncTask.new() do |task|
        task.ghp_dir = ghp_dir
        task.sync_args.push(*sync_args) unless sync_args.nil?()
      end
      
      sync_task = Rake::Task[sync_task.name]
      
      sync_task.reenable()
      sync_task.invoke(deploy)
      
      app.ran_cmd = true
    end
  end
end
