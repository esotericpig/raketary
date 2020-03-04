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


TESTING_RAKETARY = ($0 == __FILE__)

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
# @author Jonathan Bradley Whited (@esotericpig)
# @since  0.1.0
###
module Raketary
end

Raketary::App.new().run() if TESTING_RAKETARY
