require 'spec_helper'

  describe 'Post' do 
    before do 
      @user = User.create(username: "mikejonez", email: "mike@mikjonez.com", password: "mikeymikejonez")
      @post = Post.create(title: "My first post", content: "some content", user_id: 1)
    end

      it 'saves post to db' do 
        expect(@post).to eq(Post.find(1))
      end

      it 'saves post to right user' do 
        expect(@post.user_id).to eq(@user.id)
      end


  end