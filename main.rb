require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg' # to connect to postgres

require_relative 'db_config'
require_relative 'models/stretch'
require_relative 'models/stretch_type'
require_relative 'models/user'
require_relative 'models/entry'

enable :sessions

helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

end

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :index, :layout => :layout_main
end

# get all stretches according to category
get '/stretches' do
	if logged_in?
		@stretch_types = StretchType.all
		if params[:stretch_type_id].nil? || params[:stretch_type_id].empty?
	    @stretches = Stretch.all
	  else  
	    @stretches = Stretch.where(stretch_type_id: params[:stretch_type_id])
	  end

	  # for random inspiration posts
	  @rand_entries = []
	  for i in 0..5
	  	@rand_entries << Entry.where.not(post: nil).sample
	  end
	else
		redirect to '/login'
	 end

	erb :'/stretches/show'
end

# get form for new stretch
get '/stretches/new' do
	if !logged_in?
		redirect to '/login'
	end	
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

# list entries of current user
get '/user/entries' do
	if logged_in?
		@entries_pending = Entry.where(user_id: current_user.id, status: 'PENDING')
		@entries_completed = Entry.where(user_id: current_user.id, status: 'COMPLETED')
	else
		redirect to '/login'
	end
	erb :entries
end

# add new entry to pending
post '/user/entries' do
	entry = Entry.new(
		user_id: current_user.id,
		stretch_id: params[:stretch_id].to_i
	)

	entry.save
	
	redirect to '/user/entries'
end

# update pending to completed
put '/user/entries/:id' do
	entry = Entry.find_by(id: params[:id].to_i)
	entry.status = 'COMPLETED'
	entry.date_created = Time.now.to_date
	entry.save
	redirect to '/user/entries'
end

# delete 
delete '/user/entries/:id' do
		entry = Entry.find_by(id: params[:id])
		entry.destroy
		redirect to '/user/entries'
end

# get post form
get '/user/entries/post/:id/edit' do
	if logged_in?
		@entry = Entry.find_by(id: params[:id])
		@entry_id = params[:id]
	else
		redirect to '/login'
	end
	erb :post
end

# update image or post
put '/user/entries/post/:id' do
	@post = params[:post]
	entry = Entry.find_by(id: params[:id])
	entry.post = @post
	entry.save
	redirect to '/user/entries'
end

# -----------------------------
# AUTHENTICATION
# -----------------------------

# show signup form
get  '/signup' do
	if logged_in?
		redirect to '/stretches'
	end

	erb :signup, :layout => :layout_authform
end

# create user
post '/register' do
	user = User.new(
		name: params[:username],
		email: params[:email],
		password: params[:password]
	)

	user.save

	redirect to '/'

end

# show login form
get '/login' do 
	if logged_in?
		redirect to '/stretches'
	end

  erb :login, :layout => :layout_authform
 end

# create a session (client side)
post '/session' do

  user = User.find_by(email: params[:email])

  if user && user.authenticate(params[:password]) # successfully verify the username and password
    session[:user_id] = user.id   
    redirect to '/stretches'
  else
    redirect to '/login'
  end

end

delete '/session' do
  
  session[:user_id] = nil
  redirect to '/login'

end
