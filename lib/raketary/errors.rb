# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019 Bradley Whited
#
# SPDX-License-Identifier: LGPL-3.0-or-later
#++

module Raketary
  class DoNotRunCmdError < StandardError
    attr_accessor :soft_msg

    def initialize(msg = nil)
      super

      @soft_msg = msg
    end
  end
end
