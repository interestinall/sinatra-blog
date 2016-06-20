class UserController < ApplicationController


  get '/signup' do 
    haml :'users/signup'
  end

  post '/signup' do 
    @user = User.new(params[:user])
    if @user.save
      redirect "/users/#{@user.id}"
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
      #TODO redirect somehwere better
      redirect '/'
    end
  end

  post '/login' do 
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect 'signup'
    end
  end

end