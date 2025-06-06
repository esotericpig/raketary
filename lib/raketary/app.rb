# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019 Bradley Whited
#
# SPDX-License-Identifier: LGPL-3.0-or-later
#++

require 'raketary/bump_cmd'
require 'raketary/cmd'
require 'raketary/ghp_sync_cmd'
require 'raketary/github_pkg_cmd'
require 'raketary/irb_cmd'
require 'raketary/nokogiri_cmd'
require 'raketary/run_cmd'
require 'raketary/sub_cmd'
require 'raketary/version'

module Raketary
  class App < Cmd
    attr_reader :args
    attr_reader :options
    attr_reader :parsers
    attr_accessor :ran_cmd
    attr_accessor :soft_error
    attr_reader :version

    alias_method :ran_cmd?,:ran_cmd

    def initialize(args = ARGV)
      super(self,'raketary')

      @args = args
      @options = {}
      @parsers = []
      @ran_cmd = false
      @soft_error = nil
      @version = Raketary::VERSION

      @sub_cmds = {
        'bump' => SubCmd.new("Bump your project's version",BumpCmd),
        'ghp_sync' => SubCmd.new('Sync YARDoc to GitHub Pages repo',GHPSyncCmd),
        'github_pkg' => SubCmd.new("Publish your project's gem(s) to GitHub Packages",GitHubPkgCmd),
        'irb' => SubCmd.new('Open an irb session loaded with your library',IRBCmd),
        'nokogiri' => SubCmd.new('Install Nokogiri libs',NokogiriCmd),
        'run' => SubCmd.new("Run your project's main file: #{@name} run -- --version",RunCmd),
      }

      parse!(true) do |op|
        op.banner = "Usage: #{@name} [options] [command] [options]..."

        op.on_tail('-v','--version',"show the version of #{@name}") do
          puts "#{@name} v#{@version}"
          exit
        end
      end
    end

    def run
      return if @ran_cmd

      puts @parsers.join

      if !@soft_error.nil?
        puts
        puts "ERROR: #{@soft_error}"
      end
    end
  end
end
