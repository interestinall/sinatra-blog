class PostController < ApplicationController

  get '/posts/new' do 
    if session[:id]
      haml :'posts/new'
    else
      redirect '/login'
    end
  end

  post '/posts' do 
    user = User.find(session[:id])
    post = Post.create(title: params[:post][:title], content: params[:post][:content], user_id: user.id)
    redirect "#{user.username}/posts/#{post.id}"
  end

  get '/:username/posts/:id' do 
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    haml :'posts/show'

  end

end