class UserController < ApplicationController


  get '/signup' do 
    haml :'users/signup'
  end
end