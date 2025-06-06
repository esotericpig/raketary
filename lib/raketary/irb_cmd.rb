# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019 Bradley Whited
#
# SPDX-License-Identifier: LGPL-3.0-or-later
#++

require 'rake'
require 'raketary/cmd'
require 'raketeer/irb_task'

module Raketary
  class IRBCmd < Cmd
    def initialize(*)
      super

      parse! do |_op|
        # op.separator(op.summary_indent)
      end
    end

    def run
      super

      irb_task = Raketeer::IRBTask.new
      irb_task = Rake::Task[irb_task.name]

      irb_task.reenable
      irb_task.invoke

      app.ran_cmd = true
    end
  end
end
