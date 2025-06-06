# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019 Bradley Whited
#
# SPDX-License-Identifier: LGPL-3.0-or-later
#++

require 'optparse'
require 'raketary/errors'

module Raketary
  class Cmd
    attr_reader :app
    attr_reader :name
    attr_reader :sub_cmds
    attr_reader :leftover_args

    def initialize(app,name)
      @app = app
      @name = name
      @sub_cmds = {}
      @leftover_args = []
    end

    def parse!(is_app = false)
      parser = OptionParser.new do |op|
        op.program_name = app.name
        op.version = app.version

        op.banner = ''
        op.separator('') if is_app

        if !@sub_cmds.empty?
          op.separator(is_app ? 'Commands:' : "[#{@name}] Commands:")

          @sub_cmds.each do |name,sub_cmd|
            op.separator("#{op.summary_indent}#{format("%-#{op.summary_width}s #{sub_cmd.desc}",name)}")
          end
          op.separator('')
        end

        op.separator(is_app ? 'Options:' : "[#{@name}] Options:")
        op.on_tail('-h','--help','show this help')

        yield op
      end

      options = {}
      @leftover_args = parser.order!(app.args,into: options).dup

      # NOTE: Can't use each_key(), since we modify the hash in the loop.
      options.keys.each do |key|
        if (key_s = key.to_s).include?('-')
          options[key_s.tr('-','_').to_sym] = options[key]
          options.delete(key)
        end
      end
      app.options.merge!(options)

      app.parsers << parser

      if !app.args.nil? &&
         !(sub_cmd_name = app.args.shift).nil? &&
         !(sub_cmd = @sub_cmds[sub_cmd_name]).nil?
        begin
          sub_cmd.cmd_class.new(app,sub_cmd_name).run
        rescue DoNotRunCmdError => e
          app.soft_error = e.soft_msg
        end
      end

      return parser
    end

    def run
      raise DoNotRunCmdError if app.options[:help] || app.ran_cmd?
    end
  end
end
