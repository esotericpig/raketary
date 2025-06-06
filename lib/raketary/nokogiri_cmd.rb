# encoding: UTF-8
# frozen_string_literal: true

#--
# This file is part of Raketary.
# Copyright (c) 2019 Bradley Whited
#
# SPDX-License-Identifier: LGPL-3.0-or-later
#++

require 'raketary/cmd'
require 'raketary/errors'
require 'raketeer/nokogiri_install_tasks'

module Raketary
  class NokogiriCmd < Cmd
    def initialize(*)
      super

      @main_opts = 0

      parse! do |op|
        op.on('-a','--apt','install Nokogiri libs for Ubuntu/Debian') do
          @main_opts += 1
          true
        end
        op.on('-d','--dnf','install Nokogiri libs for Fedora/CentOS/Red Hat') do
          @main_opts += 1
          true
        end
        op.on('-o','--other','install Nokogiri libs for other OSes') do
          @main_opts += 1
          true
        end
        op.separator(op.summary_indent)
      end
    end

    def run
      super
      return if @main_opts <= 0

      if @main_opts >= 2
        raise DoNotRunCmdError,'Please choose only one platform to install the libs for.'
      end

      install_task = nil

      if app.options[:apt]
        install_task = Raketeer::NokogiriAPTTask.new
      elsif app.options[:dnf]
        install_task = Raketeer::NokogiriDNFTask.new
      elsif app.options[:other]
        install_task = Raketeer::NokogiriOtherTask.new
      end

      if !install_task.nil?
        install_task.run(install_task,nil)

        app.ran_cmd = true
      end
    end
  end
end
