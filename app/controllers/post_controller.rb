require 'rack-flash'

class PostController < ApplicationController
  use Rack::Flash

  get '/posts/new' do
    if session[:id]
      haml :'posts/new'
    else
      redirect '/login'
    end
  end

  post '/posts' do
    user = User.find(session[:id])
    post = user.posts.build(params[:post])
    if post.save
      redirect "#{user.username}/posts/#{post.id}"
    else
      flash[:message] = "Can't save it w/o a title and some content, brah."
      redirect '/posts/new'
    end
  end

  get '/:username/posts/:id' do
    # binding.pry
    @user = User.find_by(username: params[:username])
    if @user.post_ids.include?(params[:id].to_i)
      @post = Post.find(params[:id])
      @session = session
      haml :'posts/show'
    else
      haml :'404'
    end

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
    if post.update(title: params[:post][:title], content: params[:post][:content])
      redirect "#{params[:username]}/posts/#{post.id}"
    else
      flash[:message] = "If you are going to make an edit, you have make sure both fields have content in them."
      redirect "#{params[:username]}/posts/#{post.id}/edit"
    end
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

  post '/:username/posts/:id/comment' do
    user = User.find(session[:id])
    if params[:comment].strip == ""
       flash[:message] = "Looks like you tried to send a blank comment :/"
       redirect "#{params[:username]}/posts/#{params[:id]}"
    else
      @comment = Comment.create(content: params[:comment], user_id: user.id, post_id: params[:id] )
      redirect "#{params[:username]}/posts/#{params[:id]}"
    end

  end








end
