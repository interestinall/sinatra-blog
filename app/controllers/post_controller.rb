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

  get '/:username/posts' do 
    @user = User.find_by(username: params[:username])
    if session[:id] == @user.id
      @posts = @user.posts
      haml :'posts/index'
    else
      redirect '/login'
    end
  end

  get '/:username/posts/:id/edit' do 
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    haml :'posts/edit'
  end

  post '/:username/posts/:id'  do 
    post = Post.find(params[:id])
    post.update(title: params[:post][:title], content: params[:post][:content])
    redirect "#{params[:username]}/posts/#{post.id}"
  end

  post '/:username/posts/:id/delete' do 
    if session[:id]
      post = Post.find(params[:id])
      user = User.find(post.user_id)
      if session[:id] = user.id
        post.delete
        redirect "#{user.username}/posts"
      else
        redirect '/login'
      end
    else
      redirect '/login'
    end

  end








end