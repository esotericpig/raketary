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
require 'raketary/errors'
require 'raketeer/nokogiri_install_tasks'

module Raketary
  ###
  # @author Jonathan Bradley Whited (@esotericpig)
  # @since  0.1.0
  ###
  class AppNokogiri < Cmd
    def initialize(*)
      super
      
      @main_opts = 0
      
      parse!() do |op|
        op.on('-a','--apt','install Nokogiri libs for Ubuntu/Debian') do
          @main_opts += 1
          true
        end
        op.on('-d','--dnf','install Nokogiri libs for Fedora/CentOS/Red Hat') do
          @main_opts += 1
          true
        end
        op.on('-o','--other','install Nokogiri libs for other OSes') do
          @main_opts += 1
          true
        end
        op.separator op.summary_indent
      end
    end
    
    def run()
      super()
      return if @main_opts <= 0
      
      if @main_opts >= 2
        raise DoNotRunCmdError,'Please choose only one platform to install the libs for.'
      end
      
      install_task = nil
      
      if app.options[:apt]
        install_task = Raketeer::NokogiriAPTTask.new()
      elsif app.options[:dnf]
        install_task = Raketeer::NokogiriDNFTask.new()
      elsif app.options[:other]
        install_task = Raketeer::NokogiriOtherTask.new()
      end
      
      if !install_task.nil?()
        install_task.run(install_task,nil)
        
        app.ran_cmd = true
      end
    end
  end
end
