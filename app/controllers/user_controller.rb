class UserController < ApplicationController


  get '/signup' do 
    haml :'users/signup'
  end

  post '/signup' do 
    binding.pry
  end
end