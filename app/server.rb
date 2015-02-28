require 'rubygems'
require 'sinatra/base'
require 'data_mapper'

require './app/helpers/current_user'

class Chitter < Sinatra::Base
  enable :sessions

  include CurrentUser

  env = ENV['RACK_ENV'] || 'development'
  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
  require './app/models/user'
  DataMapper.finalize
  DataMapper.auto_upgrade!

  get '/' do
    erb :index
  end

  get '/users/sign_in' do
    erb :"users/sign_in"
  end

  post '/users/sign_in' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to '/'
  end

end
