class UserController < ApplicationController


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
      binding.pry
      redirect "/users/#{user.id}"
    else
      redirect 'signup'
    end
  end

end