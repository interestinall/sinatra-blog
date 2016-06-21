require 'rack-flash'

class UserController < ApplicationController
  use Rack::Flash

  get '/signup' do 
    if !session[:id]
      haml :'users/signup'
    end
  end

  post '/signup' do 
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id 
      redirect "/users/#{@user.id}"
    else 
      flash[:message] = "Make sure to fill in all the fields."
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
      redirect '/posts/new'
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