# encoding: UTF-8
# frozen_string_literal: true


require 'bundler/gem_tasks'

require 'rake/clean'
require 'raketary/version'
require 'raketeer/run'
require 'yard'


task default: [:run]

CLEAN.exclude('.git/','stock/')
CLOBBER.include('doc/')


YARD::Rake::YardocTask.new do |task|
  task.files = [File.join('lib','**','*.rb')]

  task.options += ['--files','CHANGELOG.md,LICENSE.txt']
  task.options += ['--readme','README.md']

  task.options << '--protected' # Show protected methods
  #task.options += ['--template-path',File.join('yard','templates')]
  task.options += ['--title',"Raketary v#{Raketary::VERSION} Doc"]
end
