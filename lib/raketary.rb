# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019-2021 Jonathan Bradley Whited
#
# SPDX-License-Identifier: LGPL-3.0-or-later
#++


TESTING_RAKETARY = ($PROGRAM_NAME == __FILE__)

if TESTING_RAKETARY
  require 'rubygems'
  require 'bundler/setup'
end

require 'raketary/app'
require 'raketary/bump_cmd'
require 'raketary/cmd'
require 'raketary/errors'
require 'raketary/ghp_sync_cmd'
require 'raketary/github_pkg_cmd'
require 'raketary/irb_cmd'
require 'raketary/nokogiri_cmd'
require 'raketary/run_cmd'
require 'raketary/sub_cmd'
require 'raketary/version'


###
# @author Jonathan Bradley Whited
# @since  0.1.0
###
module Raketary
end

Raketary::App.new.run if TESTING_RAKETARY
