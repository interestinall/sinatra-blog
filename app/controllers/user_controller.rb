require 'rack-flash'

class UserController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if !session[:id]
      haml :'users/signup'
    else
      redirect "/#{user.username}/posts"
    end
  end

  post '/signup' do
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Make sure to fill in all the fields and that you don't already have an account with the email you are using."
      redirect '/signup'
    end
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    haml :'users/show'
  end

  get '/login' do
    if !session[:id]
      haml :'users/login'
    else
      #TODO redirect somehwere better, maybe a list of their post titles
      user = User.find(session[:id])
      redirect "/#{user.username}/posts"
    end
  end

  post '/login' do
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:id] = user.id
      redirect "/users/#{user.id}"
    else
      flash[:message] = "Invalid data. Sure you have an account?"
      redirect '/login'
    end
  end

  get '/logout' do
    if !session[:id].nil?
      session.clear
    end
    redirect '/'
  end


end
