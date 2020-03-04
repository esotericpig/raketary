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


require 'rake'
require 'raketary/cmd'
require 'raketeer/irb_task'


module Raketary
  ###
  # @author Jonathan Bradley Whited (@esotericpig)
  # @since  0.1.0
  ###
  class IRBCmd < Cmd
    def initialize(*)
      super
      
      parse!() do |op|
        #op.separator op.summary_indent
      end
    end
    
    def run()
      super()
      
      irb_task = Raketeer::IRBTask.new()
      irb_task = Rake::Task[irb_task.name]
      
      irb_task.reenable()
      irb_task.invoke()
      
      app.ran_cmd = true
    end
  end
end
