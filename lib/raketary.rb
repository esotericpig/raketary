# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019 Bradley Whited
#
# SPDX-License-Identifier: LGPL-3.0-or-later
#++

module Raketary
  IS_TEST = ($PROGRAM_NAME == __FILE__)
end

if Raketary::IS_TEST
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

module Raketary
end

Raketary::App.new.run if Raketary::IS_TEST
