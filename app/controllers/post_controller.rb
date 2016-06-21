class PostController < ApplicationController

  get '/posts/new' do 
    # binding.pry
    if session[:id]
      haml :'posts/new'
    else
      redirect '/login'
    end
  end

  post '/posts' do 
    binding.pry

  end

end