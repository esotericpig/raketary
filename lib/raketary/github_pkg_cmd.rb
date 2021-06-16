#!/usr/bin/env ruby
# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2020-2021 Jonathan Bradley Whited
#
# SPDX-License-Identifier: LGPL-3.0-or-later
#++


require 'bundler/gem_tasks'
require 'rake'
require 'raketary/cmd'
require 'raketeer/github_pkg_task'


module Raketary
  ###
  # @author Jonathan Bradley Whited
  # @since  0.1.2
  ###
  class GitHubPkgCmd < Cmd
    def initialize(*)
      super

      parse!() do |op|
        op.on('-u','--user STR','set the GitHub username')

        op.separator op.summary_indent
      end
    end

    def run()
      super()

      ghpkg_task = Raketeer::GitHubPkgTask.new() do |task|
        task.username = app.options[:user]
      end

      ghpkg_task = Rake::Task[ghpkg_task.name]

      ghpkg_task.reenable()
      ghpkg_task.invoke()

      app.ran_cmd = true
    end
  end
end
