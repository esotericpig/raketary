#!/usr/bin/env ruby
# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019-2021 Jonathan Bradley Whited
#
# SPDX-License-Identifier: LGPL-3.0-or-later
#++


require 'optparse'
require 'raketary/errors'


module Raketary
  ###
  # @author Jonathan Bradley Whited
  # @since  0.1.0
  ###
  class Cmd
    attr_reader :app
    attr_reader :leftover_args
    attr_reader :name
    attr_reader :sub_cmds

    def initialize(app,name)
      @app = app
      @leftover_args = []
      @name = name
      @sub_cmds = {}
    end

    def parse!(is_app=false)
      parser = OptionParser.new() do |op|
        op.program_name = app.name
        op.version = app.version

        op.banner = ''
        op.separator '' if is_app

        if !@sub_cmds.empty?()
          op.separator is_app ? 'Commands:' : "[#{@name}] Commands:"

          @sub_cmds.each do |name,sub_cmd|
            name_desc = ''.dup()
            name_desc << op.summary_indent
            name_desc << ("%-#{op.summary_width}s #{sub_cmd.desc}" % [name])

            op.separator name_desc
          end
          op.separator ''
        end

        op.separator is_app ? 'Options:' : "[#{@name}] Options:"

        op.on_tail('-h','--help','show this help')

        yield op
      end

      options = {}
      @leftover_args = parser.order!(app.args,into: options).dup()

      options.keys.each do |key|
        if (key_s = key.to_s()).include?('-')
          options[key_s.gsub('-','_').to_sym()] = options[key]
          options.delete(key)
        end
      end
      app.options.merge!(options)

      app.parsers << parser

      if !app.args.nil?() && !(sub_cmd_name = app.args.shift()).nil?()
        if !(sub_cmd = @sub_cmds[sub_cmd_name]).nil?()
          begin
            sub_cmd.cmd_class.new(app,sub_cmd_name).run()
          rescue DoNotRunCmdError => e
            app.soft_error = e.soft_msg
          end
        end
      end

      return parser
    end

    def run()
      raise DoNotRunCmdError if app.options[:help] || app.ran_cmd?()
    end
  end
end
