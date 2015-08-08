class UsersController < ApplicationController

  set :views, File.join(APP_PATH, 'lib', 'views', 'users')

  get '/' do
    @users = User.all
    erb :index
  end

  get '/new' do
    @user = User.new
    erb :new
  end

  post '/' do
    puts params
    @user = User.new(params[:user])
    @user.save
    redirect to('/')
  end

  get '/:id/edit' do
    @user = User.find(params[:id])
    erb :edit
  end

  post '/:id/update' do

  end


  get '/:id/delete' do
    @user = User.find(params[:id])
    @user.delete
    redirect to('/')
  end
end