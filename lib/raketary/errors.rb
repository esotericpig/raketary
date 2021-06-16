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
  class DoNotRunCmdError < StandardError
    attr_accessor :soft_msg

    def initialize(msg=nil)
      super(msg)

      @soft_msg = msg
    end
  end
end
