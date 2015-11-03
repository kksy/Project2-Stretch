# to use: ruby console.rb

require 'active_record'
require 'pry'

# show sql in the terminal
ActiveRecord::Base.logger = Logger.new(STDERR)

require_relative 'db_config'
require_relative 'models/stretch'
require_relative 'models/stretch_type'
require_relative 'models/user'
require_relative 'models/entry'

binding.pry