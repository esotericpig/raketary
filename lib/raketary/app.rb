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
require 'raketary/sub_cmd'
require 'raketary/version'

module Raketary
  ###
  # @author Jonathan Bradley Whited (@esotericpig)
  # @since  0.1.0
  ###
  class App < Cmd
    attr_reader :args
    attr_reader :options
    attr_reader :parsers
    attr_accessor :ran_cmd
    attr_reader :version
    
    alias_method :ran_cmd?,:ran_cmd
    
    def initialize(args=ARGV)
      super(self,'raketary')
      
      @args = args
      @options = {}
      @parsers = []
      @ran_cmd = false
      @version = Raketary::VERSION
      
      @sub_cmds = {
        'bump' => SubCmd.new(%q(Bump your project's version),AppBump)
      }
      
      parse!(true) do |op|
        op.banner = "Usage: #{@name} [options] [command] [options]..."
        
        op.on_tail('-v','--version',"show the version of #{@name}") do
          puts "#{@name} v#{@version}"
          exit
        end
      end
    end
    
    def run()
      puts @parsers.join() unless @ran_cmd
    end
  end
end
