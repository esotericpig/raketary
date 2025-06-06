# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019 Bradley Whited
#
# SPDX-License-Identifier: LGPL-3.0-or-later
#++

module Raketary
  class SubCmd
    attr_reader :desc
    attr_reader :cmd_class

    def initialize(desc,cmd_class)
      @desc = desc
      @cmd_class = cmd_class
    end
  end
end
