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

end