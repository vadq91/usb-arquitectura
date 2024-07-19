require 'sinatra'
require 'sinatra/activerecord'
require_relative 'config/environment'

class TaskManagementApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    erb :index
  end

  get '/users' do
    @users = User.all
    erb :users
  end

  post '/users' do
    User.create(name: params[:name])
    redirect '/users'
  end

  get '/tasks' do
    @tasks = Task.all
    @users = User.all
    erb :tasks
  end

  post '/tasks' do
    Task.create(title: params[:title], description: params[:description], user_id: params[:user_id])
    redirect '/tasks'
  end

  run! if app_file == $0
end
