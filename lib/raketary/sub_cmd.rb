#!/usr/bin/env ruby
# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019-2021 Jonathan Bradley Whited
#
# SPDX-License-Identifier: LGPL-3.0-or-later
#++


module Raketary
  ###
  # @author Jonathan Bradley Whited
  # @since  0.1.0
  ###
  class SubCmd
    attr_reader :cmd_class
    attr_reader :desc

    def initialize(desc,cmd_class)
      @cmd_class = cmd_class
      @desc = desc
    end
  end
end
