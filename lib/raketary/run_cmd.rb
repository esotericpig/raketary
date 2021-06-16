#!/usr/bin/env ruby
# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019-2021 Jonathan Bradley Whited
#
# SPDX-License-Identifier: LGPL-3.0-or-later
#++


require 'rake'
require 'raketary/cmd'
require 'raketeer/run_task'


module Raketary
  ###
  # @author Jonathan Bradley Whited
  # @since  0.1.0
  ###
  class RunCmd < Cmd
    def initialize(*)
      super

      parse!() do |op|
        #op.separator op.summary_indent
      end
    end

    def run()
      super()

      run_task = Raketeer::RunTask.new()

      ARGV << run_task.name.to_s()
      ARGV.push(*@leftover_args)

      run_task = Rake::Task[run_task.name]

      run_task.reenable()
      run_task.invoke()

      app.ran_cmd = true
    end
  end
end
