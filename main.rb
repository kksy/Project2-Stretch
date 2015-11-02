require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg' # to connect to postgres

require_relative 'db_config'
require_relative 'models/stretch'
require_relative 'models/stretch_type'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :index
end

# logged in home page
get '/home' do

	erb :home
end

get '/stretches' do
	erb :'/stretches/show'
end

# get form for new stretch
get '/stretches/new' do
	
	erb :'/stretches/new'
end


# create new stretch
post '/stretches' do
	Stretch.create(
		task: "#{ params[:stretch] }",
		stretch_type_id: "#{ params[:stretch_type_id] }"
	)
	erb :'/stretches/show'
end

# get the form for log in
get  '/session/new' do

	erb :login
end

# get the form for sign up
get  '/register' do

	erb :register
end