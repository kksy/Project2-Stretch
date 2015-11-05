require 'active_record'
require 'carrierwave'

options = {
	adapter: 'postgresql',
	database: 'stretchapp'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || options)
# ActiveRecord::Base.establish_connection(options)
