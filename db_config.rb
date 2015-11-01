require 'active_record'

options = {
	adapter: 'postgresql',
	database: 'stretchapp'
}

ActiveRecord::Base.establish_connection(options)
