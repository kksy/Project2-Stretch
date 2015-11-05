require 'active_record'
require 'carrierwave'

options = {
	adapter: 'postgresql',
	database: 'stretchapp'
}

ActiveRecord::Base.establish_connection(options)
